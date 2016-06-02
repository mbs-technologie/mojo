// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library flog_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



class FlogDescription extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(48, 0)
  ];
  String label = null;
  int logId = 0;
  int entryCount = 0;
  int startTimeUs = 0;
  int stopTimeUs = 0;
  bool open = false;

  FlogDescription() : super(kVersions.last.size);

  static FlogDescription deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FlogDescription decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FlogDescription result = new FlogDescription();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.label = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.logId = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.entryCount = decoder0.decodeUint32(20);
    }
    if (mainDataHeader.version >= 0) {
      
      result.startTimeUs = decoder0.decodeInt64(24);
    }
    if (mainDataHeader.version >= 0) {
      
      result.stopTimeUs = decoder0.decodeInt64(32);
    }
    if (mainDataHeader.version >= 0) {
      
      result.open = decoder0.decodeBool(40, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(label, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "label of struct FlogDescription: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(logId, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "logId of struct FlogDescription: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(entryCount, 20);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "entryCount of struct FlogDescription: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt64(startTimeUs, 24);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "startTimeUs of struct FlogDescription: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt64(stopTimeUs, 32);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "stopTimeUs of struct FlogDescription: $e";
      rethrow;
    }
    try {
      encoder0.encodeBool(open, 40, 0);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "open of struct FlogDescription: $e";
      rethrow;
    }
  }

  String toString() {
    return "FlogDescription("
           "label: $label" ", "
           "logId: $logId" ", "
           "entryCount: $entryCount" ", "
           "startTimeUs: $startTimeUs" ", "
           "stopTimeUs: $stopTimeUs" ", "
           "open: $open" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["label"] = label;
    map["logId"] = logId;
    map["entryCount"] = entryCount;
    map["startTimeUs"] = startTimeUs;
    map["stopTimeUs"] = stopTimeUs;
    map["open"] = open;
    return map;
  }
}


class FlogEntry extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  int timeUs = 0;
  int logId = 0;
  int channelId = 0;
  FlogEntryDetails details = null;

  FlogEntry() : super(kVersions.last.size);

  static FlogEntry deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FlogEntry decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FlogEntry result = new FlogEntry();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.timeUs = decoder0.decodeInt64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.logId = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.channelId = decoder0.decodeUint32(20);
    }
    if (mainDataHeader.version >= 0) {
      
        result.details = FlogEntryDetails.decode(decoder0, 24);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt64(timeUs, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "timeUs of struct FlogEntry: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(logId, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "logId of struct FlogEntry: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(channelId, 20);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "channelId of struct FlogEntry: $e";
      rethrow;
    }
    try {
      encoder0.encodeUnion(details, 24, true);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "details of struct FlogEntry: $e";
      rethrow;
    }
  }

  String toString() {
    return "FlogEntry("
           "timeUs: $timeUs" ", "
           "logId: $logId" ", "
           "channelId: $channelId" ", "
           "details: $details" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["timeUs"] = timeUs;
    map["logId"] = logId;
    map["channelId"] = channelId;
    map["details"] = details;
    return map;
  }
}


class FlogChannelCreationEntryDetails extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String typeName = null;

  FlogChannelCreationEntryDetails() : super(kVersions.last.size);

  static FlogChannelCreationEntryDetails deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FlogChannelCreationEntryDetails decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FlogChannelCreationEntryDetails result = new FlogChannelCreationEntryDetails();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.typeName = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(typeName, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "typeName of struct FlogChannelCreationEntryDetails: $e";
      rethrow;
    }
  }

  String toString() {
    return "FlogChannelCreationEntryDetails("
           "typeName: $typeName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["typeName"] = typeName;
    return map;
  }
}


class FlogChannelMessageEntryDetails extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<int> data = null;

  FlogChannelMessageEntryDetails() : super(kVersions.last.size);

  static FlogChannelMessageEntryDetails deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FlogChannelMessageEntryDetails decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FlogChannelMessageEntryDetails result = new FlogChannelMessageEntryDetails();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.data = decoder0.decodeUint8Array(8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeUint8Array(data, 8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "data of struct FlogChannelMessageEntryDetails: $e";
      rethrow;
    }
  }

  String toString() {
    return "FlogChannelMessageEntryDetails("
           "data: $data" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["data"] = data;
    return map;
  }
}


class _FlogServiceCreateLoggerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  FlogLoggerInterfaceRequest logger = null;
  String label = null;

  _FlogServiceCreateLoggerParams() : super(kVersions.last.size);

  static _FlogServiceCreateLoggerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogServiceCreateLoggerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogServiceCreateLoggerParams result = new _FlogServiceCreateLoggerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.logger = decoder0.decodeInterfaceRequest(8, false, FlogLoggerStub.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.label = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(logger, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "logger of struct _FlogServiceCreateLoggerParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(label, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "label of struct _FlogServiceCreateLoggerParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_FlogServiceCreateLoggerParams("
           "logger: $logger" ", "
           "label: $label" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FlogServiceGetLogDescriptionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _FlogServiceGetLogDescriptionsParams() : super(kVersions.last.size);

  static _FlogServiceGetLogDescriptionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogServiceGetLogDescriptionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogServiceGetLogDescriptionsParams result = new _FlogServiceGetLogDescriptionsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_FlogServiceGetLogDescriptionsParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class FlogServiceGetLogDescriptionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<FlogDescription> descriptions = null;

  FlogServiceGetLogDescriptionsResponseParams() : super(kVersions.last.size);

  static FlogServiceGetLogDescriptionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FlogServiceGetLogDescriptionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FlogServiceGetLogDescriptionsResponseParams result = new FlogServiceGetLogDescriptionsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.descriptions = new List<FlogDescription>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.descriptions[i1] = FlogDescription.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      if (descriptions == null) {
        encoder0.encodeNullPointer(8, false);
      } else {
        var encoder1 = encoder0.encodePointerArray(descriptions.length, 8, bindings.kUnspecifiedArrayLength);
        for (int i0 = 0; i0 < descriptions.length; ++i0) {
          encoder1.encodeStruct(descriptions[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
        }
      }
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "descriptions of struct FlogServiceGetLogDescriptionsResponseParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "FlogServiceGetLogDescriptionsResponseParams("
           "descriptions: $descriptions" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["descriptions"] = descriptions;
    return map;
  }
}


class _FlogServiceCreateReaderParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  FlogReaderInterfaceRequest reader = null;
  int logId = 0;

  _FlogServiceCreateReaderParams() : super(kVersions.last.size);

  static _FlogServiceCreateReaderParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogServiceCreateReaderParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogServiceCreateReaderParams result = new _FlogServiceCreateReaderParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.reader = decoder0.decodeInterfaceRequest(8, false, FlogReaderStub.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.logId = decoder0.decodeUint32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(reader, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "reader of struct _FlogServiceCreateReaderParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(logId, 12);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "logId of struct _FlogServiceCreateReaderParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_FlogServiceCreateReaderParams("
           "reader: $reader" ", "
           "logId: $logId" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FlogLoggerLogChannelCreationParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  int timeUs = 0;
  int channelId = 0;
  String typeName = null;

  _FlogLoggerLogChannelCreationParams() : super(kVersions.last.size);

  static _FlogLoggerLogChannelCreationParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogLoggerLogChannelCreationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogLoggerLogChannelCreationParams result = new _FlogLoggerLogChannelCreationParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.timeUs = decoder0.decodeInt64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.channelId = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.typeName = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt64(timeUs, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "timeUs of struct _FlogLoggerLogChannelCreationParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(channelId, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "channelId of struct _FlogLoggerLogChannelCreationParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(typeName, 24, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "typeName of struct _FlogLoggerLogChannelCreationParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_FlogLoggerLogChannelCreationParams("
           "timeUs: $timeUs" ", "
           "channelId: $channelId" ", "
           "typeName: $typeName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["timeUs"] = timeUs;
    map["channelId"] = channelId;
    map["typeName"] = typeName;
    return map;
  }
}


class _FlogLoggerLogChannelMessageParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  int timeUs = 0;
  int channelId = 0;
  List<int> data = null;

  _FlogLoggerLogChannelMessageParams() : super(kVersions.last.size);

  static _FlogLoggerLogChannelMessageParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogLoggerLogChannelMessageParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogLoggerLogChannelMessageParams result = new _FlogLoggerLogChannelMessageParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.timeUs = decoder0.decodeInt64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.channelId = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.data = decoder0.decodeUint8Array(24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt64(timeUs, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "timeUs of struct _FlogLoggerLogChannelMessageParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(channelId, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "channelId of struct _FlogLoggerLogChannelMessageParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint8Array(data, 24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "data of struct _FlogLoggerLogChannelMessageParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_FlogLoggerLogChannelMessageParams("
           "timeUs: $timeUs" ", "
           "channelId: $channelId" ", "
           "data: $data" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["timeUs"] = timeUs;
    map["channelId"] = channelId;
    map["data"] = data;
    return map;
  }
}


class _FlogLoggerLogChannelDeletionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int timeUs = 0;
  int channelId = 0;

  _FlogLoggerLogChannelDeletionParams() : super(kVersions.last.size);

  static _FlogLoggerLogChannelDeletionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogLoggerLogChannelDeletionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogLoggerLogChannelDeletionParams result = new _FlogLoggerLogChannelDeletionParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.timeUs = decoder0.decodeInt64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.channelId = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt64(timeUs, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "timeUs of struct _FlogLoggerLogChannelDeletionParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(channelId, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "channelId of struct _FlogLoggerLogChannelDeletionParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_FlogLoggerLogChannelDeletionParams("
           "timeUs: $timeUs" ", "
           "channelId: $channelId" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["timeUs"] = timeUs;
    map["channelId"] = channelId;
    return map;
  }
}


class _FlogReaderGetEntriesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int startIndex = 0;
  int maxCount = 0;

  _FlogReaderGetEntriesParams() : super(kVersions.last.size);

  static _FlogReaderGetEntriesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FlogReaderGetEntriesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FlogReaderGetEntriesParams result = new _FlogReaderGetEntriesParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.startIndex = decoder0.decodeUint32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.maxCount = decoder0.decodeUint32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeUint32(startIndex, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "startIndex of struct _FlogReaderGetEntriesParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(maxCount, 12);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "maxCount of struct _FlogReaderGetEntriesParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_FlogReaderGetEntriesParams("
           "startIndex: $startIndex" ", "
           "maxCount: $maxCount" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["startIndex"] = startIndex;
    map["maxCount"] = maxCount;
    return map;
  }
}


class FlogReaderGetEntriesResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  List<FlogEntry> entries = null;
  int entryCount = 0;
  bool open = false;

  FlogReaderGetEntriesResponseParams() : super(kVersions.last.size);

  static FlogReaderGetEntriesResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FlogReaderGetEntriesResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FlogReaderGetEntriesResponseParams result = new FlogReaderGetEntriesResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.entries = new List<FlogEntry>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.entries[i1] = FlogEntry.decode(decoder2);
        }
      }
    }
    if (mainDataHeader.version >= 0) {
      
      result.entryCount = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.open = decoder0.decodeBool(20, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      if (entries == null) {
        encoder0.encodeNullPointer(8, false);
      } else {
        var encoder1 = encoder0.encodePointerArray(entries.length, 8, bindings.kUnspecifiedArrayLength);
        for (int i0 = 0; i0 < entries.length; ++i0) {
          encoder1.encodeStruct(entries[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
        }
      }
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "entries of struct FlogReaderGetEntriesResponseParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(entryCount, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "entryCount of struct FlogReaderGetEntriesResponseParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeBool(open, 20, 0);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "open of struct FlogReaderGetEntriesResponseParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "FlogReaderGetEntriesResponseParams("
           "entries: $entries" ", "
           "entryCount: $entryCount" ", "
           "open: $open" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["entries"] = entries;
    map["entryCount"] = entryCount;
    map["open"] = open;
    return map;
  }
}



enum FlogEntryDetailsTag {
  channelCreation,
  channelMessage,
  unknown
}

class FlogEntryDetails extends bindings.Union {
  static final _tagToInt = const {
    FlogEntryDetailsTag.channelCreation: 0,
    FlogEntryDetailsTag.channelMessage: 1,
  };

  static final _intToTag = const {
    0: FlogEntryDetailsTag.channelCreation,
    1: FlogEntryDetailsTag.channelMessage,
  };

  var _data;
  FlogEntryDetailsTag _tag = FlogEntryDetailsTag.unknown;

  FlogEntryDetailsTag get tag => _tag;
  FlogChannelCreationEntryDetails get channelCreation {
    if (_tag != FlogEntryDetailsTag.channelCreation) {
      throw new bindings.UnsetUnionTagError(_tag, FlogEntryDetailsTag.channelCreation);
    }
    return _data;
  }

  set channelCreation(FlogChannelCreationEntryDetails value) {
    _tag = FlogEntryDetailsTag.channelCreation;
    _data = value;
  }
  FlogChannelMessageEntryDetails get channelMessage {
    if (_tag != FlogEntryDetailsTag.channelMessage) {
      throw new bindings.UnsetUnionTagError(_tag, FlogEntryDetailsTag.channelMessage);
    }
    return _data;
  }

  set channelMessage(FlogChannelMessageEntryDetails value) {
    _tag = FlogEntryDetailsTag.channelMessage;
    _data = value;
  }

  static FlogEntryDetails decode(bindings.Decoder decoder0, int offset) {
    int size = decoder0.decodeUint32(offset);
    if (size == 0) {
      return null;
    }
    FlogEntryDetails result = new FlogEntryDetails();

    
    FlogEntryDetailsTag tag = _intToTag[decoder0.decodeUint32(offset + 4)];
    switch (tag) {
      case FlogEntryDetailsTag.channelCreation:
        
        var decoder1 = decoder0.decodePointer(offset + 8, false);
        result.channelCreation = FlogChannelCreationEntryDetails.decode(decoder1);
        break;
      case FlogEntryDetailsTag.channelMessage:
        
        var decoder1 = decoder0.decodePointer(offset + 8, false);
        result.channelMessage = FlogChannelMessageEntryDetails.decode(decoder1);
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
      case FlogEntryDetailsTag.channelCreation:
        encoder0.encodeStruct(channelCreation, offset + 8, false);
        break;
      case FlogEntryDetailsTag.channelMessage:
        encoder0.encodeStruct(channelMessage, offset + 8, false);
        break;
      default:
        throw new bindings.MojoCodecError("Bad union tag: $_tag");
    }
  }

  String toString() {
    String result = "FlogEntryDetails(";
    switch (_tag) {
      case FlogEntryDetailsTag.channelCreation:
        result += "channelCreation";
        break;
      case FlogEntryDetailsTag.channelMessage:
        result += "channelMessage";
        break;
      default:
        result += "unknown";
    }
    result += ": $_data)";
    return result;
  }
}
const int _flogServiceMethodCreateLoggerName = 0;
const int _flogServiceMethodGetLogDescriptionsName = 1;
const int _flogServiceMethodCreateReaderName = 2;

class _FlogServiceServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class FlogService {
  static const String serviceName = "mojo::flog::FlogService";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _FlogServiceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static FlogServiceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    FlogServiceProxy p = new FlogServiceProxy.unbound();
    String name = serviceName ?? FlogService.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void createLogger(FlogLoggerInterfaceRequest logger, String label);
  dynamic getLogDescriptions([Function responseFactory = null]);
  void createReader(FlogReaderInterfaceRequest reader, int logId);
}

abstract class FlogServiceInterface
    implements bindings.MojoInterface<FlogService>,
               FlogService {
  factory FlogServiceInterface([FlogService impl]) =>
      new FlogServiceStub.unbound(impl);

  factory FlogServiceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [FlogService impl]) =>
      new FlogServiceStub.fromEndpoint(endpoint, impl);

  factory FlogServiceInterface.fromMock(
      FlogService mock) =>
      new FlogServiceProxy.fromMock(mock);
}

abstract class FlogServiceInterfaceRequest
    implements bindings.MojoInterface<FlogService>,
               FlogService {
  factory FlogServiceInterfaceRequest() =>
      new FlogServiceProxy.unbound();
}

class _FlogServiceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<FlogService> {
  FlogService impl;

  _FlogServiceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _FlogServiceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _FlogServiceProxyControl.unbound() : super.unbound();

  String get serviceName => FlogService.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _flogServiceMethodGetLogDescriptionsName:
        var r = FlogServiceGetLogDescriptionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_FlogServiceProxyControl($superString)";
  }
}

class FlogServiceProxy
    extends bindings.Proxy<FlogService>
    implements FlogService,
               FlogServiceInterface,
               FlogServiceInterfaceRequest {
  FlogServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _FlogServiceProxyControl.fromEndpoint(endpoint));

  FlogServiceProxy.fromHandle(core.MojoHandle handle)
      : super(new _FlogServiceProxyControl.fromHandle(handle));

  FlogServiceProxy.unbound()
      : super(new _FlogServiceProxyControl.unbound());

  factory FlogServiceProxy.fromMock(FlogService mock) {
    FlogServiceProxy newMockedProxy =
        new FlogServiceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static FlogServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FlogServiceProxy"));
    return new FlogServiceProxy.fromEndpoint(endpoint);
  }


  void createLogger(FlogLoggerInterfaceRequest logger, String label) {
    if (impl != null) {
      impl.createLogger(logger, label);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _FlogServiceCreateLoggerParams();
    params.logger = logger;
    params.label = label;
    ctrl.sendMessage(params,
        _flogServiceMethodCreateLoggerName);
  }
  dynamic getLogDescriptions([Function responseFactory = null]) {
    if (impl != null) {
      return new Future(() => impl.getLogDescriptions(_FlogServiceStubControl._flogServiceGetLogDescriptionsResponseParamsFactory));
    }
    var params = new _FlogServiceGetLogDescriptionsParams();
    return ctrl.sendMessageWithRequestId(
        params,
        _flogServiceMethodGetLogDescriptionsName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void createReader(FlogReaderInterfaceRequest reader, int logId) {
    if (impl != null) {
      impl.createReader(reader, logId);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _FlogServiceCreateReaderParams();
    params.reader = reader;
    params.logId = logId;
    ctrl.sendMessage(params,
        _flogServiceMethodCreateReaderName);
  }
}

class _FlogServiceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<FlogService> {
  FlogService _impl;

  _FlogServiceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [FlogService impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _FlogServiceStubControl.fromHandle(
      core.MojoHandle handle, [FlogService impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _FlogServiceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => FlogService.serviceName;


  static FlogServiceGetLogDescriptionsResponseParams _flogServiceGetLogDescriptionsResponseParamsFactory(List<FlogDescription> descriptions) {
    var result = new FlogServiceGetLogDescriptionsResponseParams();
    result.descriptions = descriptions;
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _flogServiceMethodCreateLoggerName:
        var params = _FlogServiceCreateLoggerParams.deserialize(
            message.payload);
        _impl.createLogger(params.logger, params.label);
        break;
      case _flogServiceMethodGetLogDescriptionsName:
        var response = _impl.getLogDescriptions(_flogServiceGetLogDescriptionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _flogServiceMethodGetLogDescriptionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _flogServiceMethodGetLogDescriptionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _flogServiceMethodCreateReaderName:
        var params = _FlogServiceCreateReaderParams.deserialize(
            message.payload);
        _impl.createReader(params.reader, params.logId);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  FlogService get impl => _impl;
  set impl(FlogService d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_FlogServiceStubControl($superString)";
  }

  int get version => 0;
}

class FlogServiceStub
    extends bindings.Stub<FlogService>
    implements FlogService,
               FlogServiceInterface,
               FlogServiceInterfaceRequest {
  FlogServiceStub.unbound([FlogService impl])
      : super(new _FlogServiceStubControl.unbound(impl));

  FlogServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [FlogService impl])
      : super(new _FlogServiceStubControl.fromEndpoint(endpoint, impl));

  FlogServiceStub.fromHandle(
      core.MojoHandle handle, [FlogService impl])
      : super(new _FlogServiceStubControl.fromHandle(handle, impl));

  static FlogServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FlogServiceStub"));
    return new FlogServiceStub.fromEndpoint(endpoint);
  }


  void createLogger(FlogLoggerInterfaceRequest logger, String label) {
    return impl.createLogger(logger, label);
  }
  dynamic getLogDescriptions([Function responseFactory = null]) {
    return impl.getLogDescriptions(responseFactory);
  }
  void createReader(FlogReaderInterfaceRequest reader, int logId) {
    return impl.createReader(reader, logId);
  }
}

const int _flogLoggerMethodLogChannelCreationName = 0;
const int _flogLoggerMethodLogChannelMessageName = 1;
const int _flogLoggerMethodLogChannelDeletionName = 2;

class _FlogLoggerServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class FlogLogger {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _FlogLoggerServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static FlogLoggerProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    FlogLoggerProxy p = new FlogLoggerProxy.unbound();
    String name = serviceName ?? FlogLogger.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void logChannelCreation(int timeUs, int channelId, String typeName);
  void logChannelMessage(int timeUs, int channelId, List<int> data);
  void logChannelDeletion(int timeUs, int channelId);
}

abstract class FlogLoggerInterface
    implements bindings.MojoInterface<FlogLogger>,
               FlogLogger {
  factory FlogLoggerInterface([FlogLogger impl]) =>
      new FlogLoggerStub.unbound(impl);

  factory FlogLoggerInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [FlogLogger impl]) =>
      new FlogLoggerStub.fromEndpoint(endpoint, impl);

  factory FlogLoggerInterface.fromMock(
      FlogLogger mock) =>
      new FlogLoggerProxy.fromMock(mock);
}

abstract class FlogLoggerInterfaceRequest
    implements bindings.MojoInterface<FlogLogger>,
               FlogLogger {
  factory FlogLoggerInterfaceRequest() =>
      new FlogLoggerProxy.unbound();
}

class _FlogLoggerProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<FlogLogger> {
  FlogLogger impl;

  _FlogLoggerProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _FlogLoggerProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _FlogLoggerProxyControl.unbound() : super.unbound();

  String get serviceName => FlogLogger.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_FlogLoggerProxyControl($superString)";
  }
}

class FlogLoggerProxy
    extends bindings.Proxy<FlogLogger>
    implements FlogLogger,
               FlogLoggerInterface,
               FlogLoggerInterfaceRequest {
  FlogLoggerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _FlogLoggerProxyControl.fromEndpoint(endpoint));

  FlogLoggerProxy.fromHandle(core.MojoHandle handle)
      : super(new _FlogLoggerProxyControl.fromHandle(handle));

  FlogLoggerProxy.unbound()
      : super(new _FlogLoggerProxyControl.unbound());

  factory FlogLoggerProxy.fromMock(FlogLogger mock) {
    FlogLoggerProxy newMockedProxy =
        new FlogLoggerProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static FlogLoggerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FlogLoggerProxy"));
    return new FlogLoggerProxy.fromEndpoint(endpoint);
  }


  void logChannelCreation(int timeUs, int channelId, String typeName) {
    if (impl != null) {
      impl.logChannelCreation(timeUs, channelId, typeName);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _FlogLoggerLogChannelCreationParams();
    params.timeUs = timeUs;
    params.channelId = channelId;
    params.typeName = typeName;
    ctrl.sendMessage(params,
        _flogLoggerMethodLogChannelCreationName);
  }
  void logChannelMessage(int timeUs, int channelId, List<int> data) {
    if (impl != null) {
      impl.logChannelMessage(timeUs, channelId, data);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _FlogLoggerLogChannelMessageParams();
    params.timeUs = timeUs;
    params.channelId = channelId;
    params.data = data;
    ctrl.sendMessage(params,
        _flogLoggerMethodLogChannelMessageName);
  }
  void logChannelDeletion(int timeUs, int channelId) {
    if (impl != null) {
      impl.logChannelDeletion(timeUs, channelId);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _FlogLoggerLogChannelDeletionParams();
    params.timeUs = timeUs;
    params.channelId = channelId;
    ctrl.sendMessage(params,
        _flogLoggerMethodLogChannelDeletionName);
  }
}

class _FlogLoggerStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<FlogLogger> {
  FlogLogger _impl;

  _FlogLoggerStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [FlogLogger impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _FlogLoggerStubControl.fromHandle(
      core.MojoHandle handle, [FlogLogger impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _FlogLoggerStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => FlogLogger.serviceName;



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _flogLoggerMethodLogChannelCreationName:
        var params = _FlogLoggerLogChannelCreationParams.deserialize(
            message.payload);
        _impl.logChannelCreation(params.timeUs, params.channelId, params.typeName);
        break;
      case _flogLoggerMethodLogChannelMessageName:
        var params = _FlogLoggerLogChannelMessageParams.deserialize(
            message.payload);
        _impl.logChannelMessage(params.timeUs, params.channelId, params.data);
        break;
      case _flogLoggerMethodLogChannelDeletionName:
        var params = _FlogLoggerLogChannelDeletionParams.deserialize(
            message.payload);
        _impl.logChannelDeletion(params.timeUs, params.channelId);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  FlogLogger get impl => _impl;
  set impl(FlogLogger d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_FlogLoggerStubControl($superString)";
  }

  int get version => 0;
}

class FlogLoggerStub
    extends bindings.Stub<FlogLogger>
    implements FlogLogger,
               FlogLoggerInterface,
               FlogLoggerInterfaceRequest {
  FlogLoggerStub.unbound([FlogLogger impl])
      : super(new _FlogLoggerStubControl.unbound(impl));

  FlogLoggerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [FlogLogger impl])
      : super(new _FlogLoggerStubControl.fromEndpoint(endpoint, impl));

  FlogLoggerStub.fromHandle(
      core.MojoHandle handle, [FlogLogger impl])
      : super(new _FlogLoggerStubControl.fromHandle(handle, impl));

  static FlogLoggerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FlogLoggerStub"));
    return new FlogLoggerStub.fromEndpoint(endpoint);
  }


  void logChannelCreation(int timeUs, int channelId, String typeName) {
    return impl.logChannelCreation(timeUs, channelId, typeName);
  }
  void logChannelMessage(int timeUs, int channelId, List<int> data) {
    return impl.logChannelMessage(timeUs, channelId, data);
  }
  void logChannelDeletion(int timeUs, int channelId) {
    return impl.logChannelDeletion(timeUs, channelId);
  }
}

const int _flogReaderMethodGetEntriesName = 0;

class _FlogReaderServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class FlogReader {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _FlogReaderServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static FlogReaderProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    FlogReaderProxy p = new FlogReaderProxy.unbound();
    String name = serviceName ?? FlogReader.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  dynamic getEntries(int startIndex,int maxCount,[Function responseFactory = null]);
}

abstract class FlogReaderInterface
    implements bindings.MojoInterface<FlogReader>,
               FlogReader {
  factory FlogReaderInterface([FlogReader impl]) =>
      new FlogReaderStub.unbound(impl);

  factory FlogReaderInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [FlogReader impl]) =>
      new FlogReaderStub.fromEndpoint(endpoint, impl);

  factory FlogReaderInterface.fromMock(
      FlogReader mock) =>
      new FlogReaderProxy.fromMock(mock);
}

abstract class FlogReaderInterfaceRequest
    implements bindings.MojoInterface<FlogReader>,
               FlogReader {
  factory FlogReaderInterfaceRequest() =>
      new FlogReaderProxy.unbound();
}

class _FlogReaderProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<FlogReader> {
  FlogReader impl;

  _FlogReaderProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _FlogReaderProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _FlogReaderProxyControl.unbound() : super.unbound();

  String get serviceName => FlogReader.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _flogReaderMethodGetEntriesName:
        var r = FlogReaderGetEntriesResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_FlogReaderProxyControl($superString)";
  }
}

class FlogReaderProxy
    extends bindings.Proxy<FlogReader>
    implements FlogReader,
               FlogReaderInterface,
               FlogReaderInterfaceRequest {
  FlogReaderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _FlogReaderProxyControl.fromEndpoint(endpoint));

  FlogReaderProxy.fromHandle(core.MojoHandle handle)
      : super(new _FlogReaderProxyControl.fromHandle(handle));

  FlogReaderProxy.unbound()
      : super(new _FlogReaderProxyControl.unbound());

  factory FlogReaderProxy.fromMock(FlogReader mock) {
    FlogReaderProxy newMockedProxy =
        new FlogReaderProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static FlogReaderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FlogReaderProxy"));
    return new FlogReaderProxy.fromEndpoint(endpoint);
  }


  dynamic getEntries(int startIndex,int maxCount,[Function responseFactory = null]) {
    if (impl != null) {
      return new Future(() => impl.getEntries(startIndex,maxCount,_FlogReaderStubControl._flogReaderGetEntriesResponseParamsFactory));
    }
    var params = new _FlogReaderGetEntriesParams();
    params.startIndex = startIndex;
    params.maxCount = maxCount;
    return ctrl.sendMessageWithRequestId(
        params,
        _flogReaderMethodGetEntriesName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class _FlogReaderStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<FlogReader> {
  FlogReader _impl;

  _FlogReaderStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [FlogReader impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _FlogReaderStubControl.fromHandle(
      core.MojoHandle handle, [FlogReader impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _FlogReaderStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => FlogReader.serviceName;


  static FlogReaderGetEntriesResponseParams _flogReaderGetEntriesResponseParamsFactory(List<FlogEntry> entries, int entryCount, bool open) {
    var result = new FlogReaderGetEntriesResponseParams();
    result.entries = entries;
    result.entryCount = entryCount;
    result.open = open;
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _flogReaderMethodGetEntriesName:
        var params = _FlogReaderGetEntriesParams.deserialize(
            message.payload);
        var response = _impl.getEntries(params.startIndex,params.maxCount,_flogReaderGetEntriesResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _flogReaderMethodGetEntriesName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _flogReaderMethodGetEntriesName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  FlogReader get impl => _impl;
  set impl(FlogReader d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_FlogReaderStubControl($superString)";
  }

  int get version => 0;
}

class FlogReaderStub
    extends bindings.Stub<FlogReader>
    implements FlogReader,
               FlogReaderInterface,
               FlogReaderInterfaceRequest {
  FlogReaderStub.unbound([FlogReader impl])
      : super(new _FlogReaderStubControl.unbound(impl));

  FlogReaderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [FlogReader impl])
      : super(new _FlogReaderStubControl.fromEndpoint(endpoint, impl));

  FlogReaderStub.fromHandle(
      core.MojoHandle handle, [FlogReader impl])
      : super(new _FlogReaderStubControl.fromHandle(handle, impl));

  static FlogReaderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FlogReaderStub"));
    return new FlogReaderStub.fromEndpoint(endpoint);
  }


  dynamic getEntries(int startIndex,int maxCount,[Function responseFactory = null]) {
    return impl.getEntries(startIndex,maxCount,responseFactory);
  }
}



