// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef EXAMPLES_FLOG_VIEWER_HANDLERS_MEDIA_MEDIA_FORMATTING_H_
#define EXAMPLES_FLOG_VIEWER_HANDLERS_MEDIA_MEDIA_FORMATTING_H_

#include <vector>

#include "examples/flog_viewer/formatting.h"
#include "mojo/services/media/common/interfaces/media_common.mojom.h"
#include "mojo/services/media/common/interfaces/media_transport.mojom.h"
#include "mojo/services/media/common/interfaces/media_types.mojom.h"
#include "mojo/services/media/common/interfaces/timelines.mojom.h"
#include "mojo/services/media/control/interfaces/media_source.mojom.h"

namespace mojo {
namespace flog {
namespace examples {
namespace handlers {
namespace media {

// Mojo defines versions of operator<< for this that produce only numbers.
const char* StringFromMediaTypeMedium(mojo::media::MediaTypeMedium value);
const char* StringFromAudioSampleFormat(mojo::media::AudioSampleFormat value);

// The following overloads add newlines.

template <typename T>
std::ostream& operator<<(std::ostream& os, const InterfacePtr<T>& value);

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypePtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypeSetPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypeDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypeSetDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::AudioMediaTypeDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::AudioMediaTypeSetDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::VideoMediaTypeDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::VideoMediaTypeSetDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::TextMediaTypeDetailsPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::TextMediaTypeSetDetailsPtr& value);
std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::SubpictureMediaTypeDetailsPtr& value);
std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::SubpictureMediaTypeSetDetailsPtr& value);
std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::MediaSourceStreamDescriptorPtr& value);
std::ostream& operator<<(std::ostream& os, const TimelineTransformPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaPacketPtr& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaPacket& value);
std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaPacketDemandPtr& value);

struct AsTime {
  explicit AsTime(int64_t time) : time_(time) {}
  int64_t time_;
};

std::ostream& operator<<(std::ostream& os, AsTime value);

template <typename T>
std::ostream& operator<<(std::ostream& os, const Array<T>& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else if (value.size() == 0) {
    return os << "<empty>" << std::endl;
  } else {
    os << std::endl;
  }

  int index = 0;
  for (T& element : const_cast<Array<T>&>(value)) {
    os << begl << "[" << index++ << "] " << element;
  }

  return os;
}

template <typename T>
std::ostream& operator<<(std::ostream& os, const std::vector<T>& value) {
  if (value.empty()) {
    return os << "<empty>" << std::endl;
  } else {
    os << std::endl;
  }

  int index = 0;
  for (const T& element : value) {
    os << begl << "[" << index++ << "] " << element;
  }

  return os;
}

}  // namespace media
}  // namespace handlers
}  // namespace examples
}  // namespace flog
}  // namespace mojo

#endif  // EXAMPLES_FLOG_VIEWER_HANDLERS_MEDIA_MEDIA_FORMATTING_H_
