// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test_included_unions_mojom;
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/mojo/bindings/types/mojom_types.mojom.dart' as mojom_types;





enum IncludedUnionTag {
  a,
  unknown
}

class IncludedUnion extends bindings.Union {
  static final _tagToInt = const {
    IncludedUnionTag.a: 0,
  };

  static final _intToTag = const {
    0: IncludedUnionTag.a,
  };

  var _data;
  IncludedUnionTag _tag = IncludedUnionTag.unknown;

  IncludedUnionTag get tag => _tag;
  int get a {
    if (_tag != IncludedUnionTag.a) {
      throw new bindings.UnsetUnionTagError(_tag, IncludedUnionTag.a);
    }
    return _data;
  }

  set a(int value) {
    _tag = IncludedUnionTag.a;
    _data = value;
  }

  static IncludedUnion decode(bindings.Decoder decoder0, int offset) {
    int size = decoder0.decodeUint32(offset);
    if (size == 0) {
      return null;
    }
    IncludedUnion result = new IncludedUnion();

    
    IncludedUnionTag tag = _intToTag[decoder0.decodeUint32(offset + 4)];
    switch (tag) {
      case IncludedUnionTag.a:
        
        result.a = decoder0.decodeInt8(offset + 8);
        break;
      default:
        throw new bindings.MojoCodecError("Bad union tag: $tag");
    }

    return result;
  }

  void encode(bindings.Encoder encoder0, int offset) {
    
    encoder0.encodeUint32(16, offset);
    encoder0.encodeUint32(_tagToInt[_tag], offset + 4);
    switch (_tag) {
      case IncludedUnionTag.a:
        encoder0.encodeInt8(a, offset + 8);
        break;
      default:
        throw new bindings.MojoCodecError("Bad union tag: $_tag");
    }
  }

  String toString() {
    String result = "IncludedUnion(";
    switch (_tag) {
      case IncludedUnionTag.a:
        result += "a";
        break;
      default:
        result += "unknown";
    }
    result += ": $_data)";
    return result;
  }
}

mojom_types.RuntimeTypeInfo getRuntimeTypeInfo() => _runtimeTypeInfo ??
    _initRuntimeTypeInfo();

Map<String, mojom_types.UserDefinedType> getAllMojomTypeDefinitions() {
  return getRuntimeTypeInfo().typeMap;
}

var _runtimeTypeInfo;
mojom_types.RuntimeTypeInfo  _initRuntimeTypeInfo() {
  // serializedRuntimeTypeInfo contains the bytes of the Mojo serialization of
  // a mojom_types.RuntimeTypeInfo struct describing the Mojom types in this
  // file. The string contains the base64 encoding of the gzip-compressed bytes.
  var serializedRuntimeTypeInfo = "H4sIAAAJbogC/7yRsU/FIBDGeZroczBxMb5NR6ees5PLG4zLG3To1FDAiqFgoCz+83qk14SiOHrJr1cIx/f1647NdUH9jnq5v/Rt0ctzD9l6k527RW6Q5/aw75727f3o3l0zqTA1j1aYKJV8sdrZHc2l+aM/dLabtR4r/C/7X1QH9ntdIufIygSur5ErpGLzh59T5AQxiEQgBg/GCW5gcG4wCt7cqODTc0hXQvBifvmIvdECtJ2Uf+VCBei1ldoOAZLs/Ow0iXcxqYcmjY61nBllnfs7Lr67lhvLcsvvK+uMdHnt/1Am/53HdwAAAP//oYyvYtACAAA=";

  // Deserialize RuntimeTypeInfo
  var bytes = BASE64.decode(serializedRuntimeTypeInfo);
  var unzippedBytes = new ZLibDecoder().convert(bytes);
  var bdata = new ByteData.view(unzippedBytes.buffer);
  var message = new bindings.Message(bdata, null, unzippedBytes.length, 0);
  _runtimeTypeInfo = mojom_types.RuntimeTypeInfo.deserialize(message);
  return _runtimeTypeInfo;
}
