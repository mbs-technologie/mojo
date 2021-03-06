// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <mojo/system/main.h>

#include "mojo/environment/scoped_chromium_init.h"
#include "mojo/public/cpp/application/run_application.h"
#include "services/icu_data/icu_data_impl.h"

MojoResult MojoMain(MojoHandle application_request) {
  mojo::ScopedChromiumInit init;
  icu_data::ICUDataImpl icu_data_impl;
  return mojo::RunApplication(application_request, &icu_data_impl);
}
