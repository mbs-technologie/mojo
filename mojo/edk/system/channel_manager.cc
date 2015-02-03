// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "mojo/edk/system/channel_manager.h"

#include "base/bind.h"
#include "base/location.h"
#include "base/message_loop/message_loop_proxy.h"

namespace mojo {
namespace system {

namespace {

void ShutdownChannelHelper(const ChannelInfo& channel_info) {
  if (base::MessageLoopProxy::current() ==
      channel_info.channel_thread_task_runner) {
    channel_info.channel->Shutdown();
  } else {
    channel_info.channel->WillShutdownSoon();
    channel_info.channel_thread_task_runner->PostTask(
        FROM_HERE, base::Bind(&Channel::Shutdown, channel_info.channel));
  }
}

}  // namespace

ChannelManager::ChannelManager(embedder::PlatformSupport* platform_support)
    : platform_support_(platform_support) {
}

ChannelManager::~ChannelManager() {
  // No need to take the lock.
  for (const auto& map_elem : channel_infos_)
    ShutdownChannelHelper(map_elem.second);
}

void ChannelManager::CreateChannelOnIOThread(
    ChannelId channel_id,
    embedder::ScopedPlatformHandle platform_handle,
    scoped_refptr<system::ChannelEndpoint> bootstrap_channel_endpoint) {
  DCHECK_NE(channel_id, kInvalidChannelId);
  DCHECK(platform_handle.is_valid());
  DCHECK(bootstrap_channel_endpoint);

  // Create and initialize a |system::Channel|.
  scoped_refptr<system::Channel> channel =
      new system::Channel(platform_support_);
  channel->Init(system::RawChannel::Create(platform_handle.Pass()));
  channel->SetBootstrapEndpoint(bootstrap_channel_endpoint);

  AddChannel(channel_id, channel, base::MessageLoopProxy::current());
}

void ChannelManager::AddChannel(
    ChannelId channel_id,
    scoped_refptr<Channel> channel,
    scoped_refptr<base::TaskRunner> channel_thread_task_runner) {
  {
    base::AutoLock locker(lock_);
    CHECK(channel_infos_.find(channel_id) == channel_infos_.end());
    channel_infos_[channel_id] =
        ChannelInfo(channel, channel_thread_task_runner);
  }
  channel->SetChannelManager(this);
}

void ChannelManager::WillShutdownChannel(ChannelId channel_id) {
  GetChannelInfo(channel_id).channel->WillShutdownSoon();
}

void ChannelManager::ShutdownChannel(ChannelId channel_id) {
  ChannelInfo channel_info;
  {
    base::AutoLock locker(lock_);
    auto it = channel_infos_.find(channel_id);
    DCHECK(it != channel_infos_.end());
    channel_info.Swap(&it->second);
    channel_infos_.erase(it);
  }
  ShutdownChannelHelper(channel_info);
}

ChannelInfo ChannelManager::GetChannelInfo(ChannelId channel_id) {
  base::AutoLock locker(lock_);
  auto it = channel_infos_.find(channel_id);
  DCHECK(it != channel_infos_.end());
  return it->second;
}

}  // namespace system
}  // namespace mojo
