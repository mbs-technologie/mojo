#!/usr/bin/env python
# Copyright 2015 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import argparse
import glob
import os
import subprocess
import sys
import tempfile
import time
import zipfile

import mopy.gn as gn
from mopy.config import Config
from mopy.paths import Paths
from mopy.version import Version

BLACKLISTED_APPS = [
    # The network service apps are not produced out of the Mojo repo, but may
    # be present in the build dir.
    "network_service.mojo",
    "network_service_apptests.mojo",
]

def target(config):
  return config.target_os + "-" + config.target_cpu

def find_apps_to_upload(build_dir):
  apps = []
  for path in glob.glob(build_dir + "/*"):
    if not os.path.isfile(path):
      continue
    _, ext = os.path.splitext(path)
    if ext != '.mojo':
      continue
    if os.path.basename(path) in BLACKLISTED_APPS:
      continue
    apps.append(path)
  return apps

def upload(config, source, dest, dry_run):
  paths = Paths(config)
  sys.path.insert(0, os.path.join(paths.src_root, "tools"))
  # pylint: disable=F0401
  import find_depot_tools

  depot_tools_path = find_depot_tools.add_depot_tools_to_path()
  gsutil_exe = os.path.join(depot_tools_path, "third_party", "gsutil", "gsutil")

  if dry_run:
    print str([gsutil_exe, "cp", source, dest])
  else:
    subprocess.check_call([gsutil_exe, "cp", source, dest])

def upload_shell(config, dry_run, verbose):
  paths = Paths(config)
  zipfile_name = target(config)
  version = Version().version

  # Upload the binary.
  # TODO(blundell): Change this to be in the same structure as the LATEST files,
  # e.g., gs://mojo/shell/linux-x64/<version>/shell.zip.
  dest = "gs://mojo/shell/" + version + "/" + zipfile_name + ".zip"
  with tempfile.NamedTemporaryFile() as zip_file:
    with zipfile.ZipFile(zip_file, 'w') as z:
      shell_path = paths.target_mojo_shell_path
      with open(shell_path) as shell_binary:
        shell_filename = os.path.basename(shell_path)
        zipinfo = zipfile.ZipInfo(shell_filename)
        zipinfo.external_attr = 0777 << 16L
        compress_type = zipfile.ZIP_DEFLATED
        if config.target_os == Config.OS_ANDROID:
          # The APK is already compressed.
          compress_type = zipfile.ZIP_STORED
        zipinfo.compress_type = compress_type
        zipinfo.date_time = time.gmtime(os.path.getmtime(shell_path))
        if verbose:
          print "zipping %s" % shell_path
        z.writestr(zipinfo, shell_binary.read())
    upload(config, zip_file.name, dest, dry_run)

  # Update the LATEST file to contain the version of the new binary.
  latest_file = "gs://mojo/shell/%s/LATEST" % target(config)
  write_file_to_gs(version, latest_file, config, dry_run)

def upload_app(app_binary_path, config, dry_run):
  app_binary_name = os.path.basename(app_binary_path)
  app_name, _ = os.path.splitext(app_binary_name)
  version = Version().version
  app_location_in_gs = ("mojo/services/" + target(config) + "/" + version +
                        "/" + app_binary_name)
  gsutil_app_location = "gs://" + app_location_in_gs
  https_app_location = "https://storage.googleapis.com/" + app_location_in_gs

  # Upload the new binary.
  upload(config, app_binary_path, gsutil_app_location, dry_run)

  # Update the app's location file to point to the new binary.
  app_location_file = ("gs://mojo/services/" + target(config) + "/" +
                       app_name + "_location")
  write_file_to_gs(https_app_location, app_location_file, config, dry_run)

def write_file_to_gs(file_contents, dest, config, dry_run):
  with tempfile.NamedTemporaryFile() as temp_version_file:
    temp_version_file.write(file_contents)
    temp_version_file.flush()
    upload(config, temp_version_file.name, dest, dry_run)

def main():
  parser = argparse.ArgumentParser(description="Upload binaries for apps and "
      "the Mojo shell to google storage (by default on Linux, but this can be "
      "changed via options).")
  parser.add_argument("-n", "--dry_run", help="Dry run, do not actually "+
      "upload", action="store_true")
  parser.add_argument("-v", "--verbose", help="Verbose mode",
      action="store_true")
  parser.add_argument("--android",
                      action="store_true",
                      help="Upload the shell and apps for Android")
  args = parser.parse_args()

  target_os = Config.OS_LINUX
  if args.android:
    target_os = Config.OS_ANDROID
  config = Config(target_os=target_os, is_debug=False)
  upload_shell(config, args.dry_run, args.verbose)

  apps_to_upload = find_apps_to_upload(
      gn.BuildDirectoryForConfig(config, Paths(config).src_root))
  for app in apps_to_upload:
    upload_app(app, config, args.dry_run)

  return 0

if __name__ == "__main__":
  sys.exit(main())
