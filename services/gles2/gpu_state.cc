// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

#include "services/gles2/gpu_state.h"

#include "services/gles2/mailbox_manager_factory.h"

namespace gles2 {

GpuState::GpuState()
    : control_thread_("gpu_command_buffer_control"),
      sync_point_manager_(gpu::SyncPointManager::Create(true)),
      share_group_(new gfx::GLShareGroup),
      mailbox_manager_(MailboxManagerFactory::Create()) {
  control_thread_.Start();
}

GpuState::~GpuState() {
}

}  // namespace gles2
