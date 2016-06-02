// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library keyboard_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/mojo/native_viewport_event_dispatcher.mojom.dart' as native_viewport_event_dispatcher_mojom;

class SubmitAction extends bindings.MojoEnum {
  static const SubmitAction done = const SubmitAction._(0);

  const SubmitAction._(int v) : super(v);

  static const Map<String, SubmitAction> valuesMap = const {
    "done": done,
  };
  static const List<SubmitAction> values = const [
    done,
  ];

  static SubmitAction valueOf(String name) => valuesMap[name];

  factory SubmitAction(int v) {
    switch (v) {
      case 0:
        return SubmitAction.done;
      default:
        return null;
    }
  }

  static SubmitAction decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    SubmitAction result = new SubmitAction(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum SubmitAction.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case done:
        return 'SubmitAction.done';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}

class KeyboardType extends bindings.MojoEnum {
  static const KeyboardType text = const KeyboardType._(0);
  static const KeyboardType number = const KeyboardType._(1);
  static const KeyboardType phone = const KeyboardType._(2);
  static const KeyboardType datetime = const KeyboardType._(3);

  const KeyboardType._(int v) : super(v);

  static const Map<String, KeyboardType> valuesMap = const {
    "text": text,
    "number": number,
    "phone": phone,
    "datetime": datetime,
  };
  static const List<KeyboardType> values = const [
    text,
    number,
    phone,
    datetime,
  ];

  static KeyboardType valueOf(String name) => valuesMap[name];

  factory KeyboardType(int v) {
    switch (v) {
      case 0:
        return KeyboardType.text;
      case 1:
        return KeyboardType.number;
      case 2:
        return KeyboardType.phone;
      case 3:
        return KeyboardType.datetime;
      default:
        return null;
    }
  }

  static KeyboardType decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    KeyboardType result = new KeyboardType(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum KeyboardType.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case text:
        return 'KeyboardType.text';
      case number:
        return 'KeyboardType.number';
      case phone:
        return 'KeyboardType.phone';
      case datetime:
        return 'KeyboardType.datetime';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}



class CompletionData extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  int id = 0;
  int position = 0;
  String text = null;
  String label = null;

  CompletionData() : super(kVersions.last.size);

  static CompletionData deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CompletionData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CompletionData result = new CompletionData();

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
      
      result.id = decoder0.decodeInt64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.position = decoder0.decodeInt32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.text = decoder0.decodeString(24, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.label = decoder0.decodeString(32, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt64(id, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "id of struct CompletionData: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(position, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "position of struct CompletionData: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(text, 24, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "text of struct CompletionData: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(label, 32, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "label of struct CompletionData: $e";
      rethrow;
    }
  }

  String toString() {
    return "CompletionData("
           "id: $id" ", "
           "position: $position" ", "
           "text: $text" ", "
           "label: $label" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["id"] = id;
    map["position"] = position;
    map["text"] = text;
    map["label"] = label;
    return map;
  }
}


class CorrectionData extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  int offset = 0;
  String oldText = null;
  String newText = null;

  CorrectionData() : super(kVersions.last.size);

  static CorrectionData deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CorrectionData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CorrectionData result = new CorrectionData();

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
      
      result.offset = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.oldText = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.newText = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(offset, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "offset of struct CorrectionData: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(oldText, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "oldText of struct CorrectionData: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(newText, 24, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "newText of struct CorrectionData: $e";
      rethrow;
    }
  }

  String toString() {
    return "CorrectionData("
           "offset: $offset" ", "
           "oldText: $oldText" ", "
           "newText: $newText" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["offset"] = offset;
    map["oldText"] = oldText;
    map["newText"] = newText;
    return map;
  }
}


class _KeyboardClientCommitCompletionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  CompletionData completion = null;

  _KeyboardClientCommitCompletionParams() : super(kVersions.last.size);

  static _KeyboardClientCommitCompletionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientCommitCompletionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientCommitCompletionParams result = new _KeyboardClientCommitCompletionParams();

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
      result.completion = CompletionData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(completion, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "completion of struct _KeyboardClientCommitCompletionParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientCommitCompletionParams("
           "completion: $completion" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["completion"] = completion;
    return map;
  }
}


class _KeyboardClientCommitCorrectionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  CorrectionData correction = null;

  _KeyboardClientCommitCorrectionParams() : super(kVersions.last.size);

  static _KeyboardClientCommitCorrectionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientCommitCorrectionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientCommitCorrectionParams result = new _KeyboardClientCommitCorrectionParams();

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
      result.correction = CorrectionData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(correction, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "correction of struct _KeyboardClientCommitCorrectionParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientCommitCorrectionParams("
           "correction: $correction" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["correction"] = correction;
    return map;
  }
}


class _KeyboardClientCommitTextParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String text = null;
  int newCursorPosition = 0;

  _KeyboardClientCommitTextParams() : super(kVersions.last.size);

  static _KeyboardClientCommitTextParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientCommitTextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientCommitTextParams result = new _KeyboardClientCommitTextParams();

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
      
      result.text = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.newCursorPosition = decoder0.decodeInt32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(text, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "text of struct _KeyboardClientCommitTextParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(newCursorPosition, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "newCursorPosition of struct _KeyboardClientCommitTextParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientCommitTextParams("
           "text: $text" ", "
           "newCursorPosition: $newCursorPosition" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["text"] = text;
    map["newCursorPosition"] = newCursorPosition;
    return map;
  }
}


class _KeyboardClientDeleteSurroundingTextParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int beforeLength = 0;
  int afterLength = 0;

  _KeyboardClientDeleteSurroundingTextParams() : super(kVersions.last.size);

  static _KeyboardClientDeleteSurroundingTextParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientDeleteSurroundingTextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientDeleteSurroundingTextParams result = new _KeyboardClientDeleteSurroundingTextParams();

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
      
      result.beforeLength = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.afterLength = decoder0.decodeInt32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(beforeLength, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "beforeLength of struct _KeyboardClientDeleteSurroundingTextParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(afterLength, 12);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "afterLength of struct _KeyboardClientDeleteSurroundingTextParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientDeleteSurroundingTextParams("
           "beforeLength: $beforeLength" ", "
           "afterLength: $afterLength" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["beforeLength"] = beforeLength;
    map["afterLength"] = afterLength;
    return map;
  }
}


class _KeyboardClientSetComposingRegionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int start = 0;
  int end = 0;

  _KeyboardClientSetComposingRegionParams() : super(kVersions.last.size);

  static _KeyboardClientSetComposingRegionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientSetComposingRegionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientSetComposingRegionParams result = new _KeyboardClientSetComposingRegionParams();

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
      
      result.start = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.end = decoder0.decodeInt32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(start, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "start of struct _KeyboardClientSetComposingRegionParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(end, 12);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "end of struct _KeyboardClientSetComposingRegionParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientSetComposingRegionParams("
           "start: $start" ", "
           "end: $end" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["start"] = start;
    map["end"] = end;
    return map;
  }
}


class _KeyboardClientSetComposingTextParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String text = null;
  int newCursorPosition = 0;

  _KeyboardClientSetComposingTextParams() : super(kVersions.last.size);

  static _KeyboardClientSetComposingTextParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientSetComposingTextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientSetComposingTextParams result = new _KeyboardClientSetComposingTextParams();

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
      
      result.text = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.newCursorPosition = decoder0.decodeInt32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(text, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "text of struct _KeyboardClientSetComposingTextParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(newCursorPosition, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "newCursorPosition of struct _KeyboardClientSetComposingTextParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientSetComposingTextParams("
           "text: $text" ", "
           "newCursorPosition: $newCursorPosition" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["text"] = text;
    map["newCursorPosition"] = newCursorPosition;
    return map;
  }
}


class _KeyboardClientSetSelectionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int start = 0;
  int end = 0;

  _KeyboardClientSetSelectionParams() : super(kVersions.last.size);

  static _KeyboardClientSetSelectionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientSetSelectionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientSetSelectionParams result = new _KeyboardClientSetSelectionParams();

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
      
      result.start = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.end = decoder0.decodeInt32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(start, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "start of struct _KeyboardClientSetSelectionParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(end, 12);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "end of struct _KeyboardClientSetSelectionParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientSetSelectionParams("
           "start: $start" ", "
           "end: $end" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["start"] = start;
    map["end"] = end;
    return map;
  }
}


class _KeyboardClientSubmitParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  SubmitAction action = null;

  _KeyboardClientSubmitParams() : super(kVersions.last.size);

  static _KeyboardClientSubmitParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardClientSubmitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardClientSubmitParams result = new _KeyboardClientSubmitParams();

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
      
        result.action = SubmitAction.decode(decoder0, 8);
        if (result.action == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable SubmitAction.');
        }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeEnum(action, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "action of struct _KeyboardClientSubmitParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardClientSubmitParams("
           "action: $action" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["action"] = action;
    return map;
  }
}


class _KeyboardServiceShowParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  KeyboardClientInterface client = null;
  KeyboardType type = null;

  _KeyboardServiceShowParams() : super(kVersions.last.size);

  static _KeyboardServiceShowParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardServiceShowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardServiceShowParams result = new _KeyboardServiceShowParams();

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
      
      result.client = decoder0.decodeServiceInterface(8, false, KeyboardClientProxy.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
        result.type = KeyboardType.decode(decoder0, 16);
        if (result.type == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable KeyboardType.');
        }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterface(client, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "client of struct _KeyboardServiceShowParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeEnum(type, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "type of struct _KeyboardServiceShowParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardServiceShowParams("
           "client: $client" ", "
           "type: $type" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _KeyboardServiceShowByRequestParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _KeyboardServiceShowByRequestParams() : super(kVersions.last.size);

  static _KeyboardServiceShowByRequestParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardServiceShowByRequestParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardServiceShowByRequestParams result = new _KeyboardServiceShowByRequestParams();

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
    return "_KeyboardServiceShowByRequestParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _KeyboardServiceHideParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _KeyboardServiceHideParams() : super(kVersions.last.size);

  static _KeyboardServiceHideParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardServiceHideParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardServiceHideParams result = new _KeyboardServiceHideParams();

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
    return "_KeyboardServiceHideParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _KeyboardServiceSetTextParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String text = null;

  _KeyboardServiceSetTextParams() : super(kVersions.last.size);

  static _KeyboardServiceSetTextParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardServiceSetTextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardServiceSetTextParams result = new _KeyboardServiceSetTextParams();

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
      
      result.text = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(text, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "text of struct _KeyboardServiceSetTextParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardServiceSetTextParams("
           "text: $text" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["text"] = text;
    return map;
  }
}


class _KeyboardServiceSetSelectionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int start = 0;
  int end = 0;

  _KeyboardServiceSetSelectionParams() : super(kVersions.last.size);

  static _KeyboardServiceSetSelectionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardServiceSetSelectionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardServiceSetSelectionParams result = new _KeyboardServiceSetSelectionParams();

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
      
      result.start = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.end = decoder0.decodeInt32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(start, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "start of struct _KeyboardServiceSetSelectionParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt32(end, 12);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "end of struct _KeyboardServiceSetSelectionParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardServiceSetSelectionParams("
           "start: $start" ", "
           "end: $end" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["start"] = start;
    map["end"] = end;
    return map;
  }
}


class _KeyboardServiceFactoryCreateKeyboardServiceParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  native_viewport_event_dispatcher_mojom.NativeViewportEventDispatcherInterfaceRequest keyEventDispatcher = null;
  KeyboardServiceInterfaceRequest serviceRequest = null;

  _KeyboardServiceFactoryCreateKeyboardServiceParams() : super(kVersions.last.size);

  static _KeyboardServiceFactoryCreateKeyboardServiceParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _KeyboardServiceFactoryCreateKeyboardServiceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _KeyboardServiceFactoryCreateKeyboardServiceParams result = new _KeyboardServiceFactoryCreateKeyboardServiceParams();

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
      
      result.keyEventDispatcher = decoder0.decodeInterfaceRequest(8, false, native_viewport_event_dispatcher_mojom.NativeViewportEventDispatcherStub.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.serviceRequest = decoder0.decodeInterfaceRequest(12, false, KeyboardServiceStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(keyEventDispatcher, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "keyEventDispatcher of struct _KeyboardServiceFactoryCreateKeyboardServiceParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInterfaceRequest(serviceRequest, 12, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "serviceRequest of struct _KeyboardServiceFactoryCreateKeyboardServiceParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_KeyboardServiceFactoryCreateKeyboardServiceParams("
           "keyEventDispatcher: $keyEventDispatcher" ", "
           "serviceRequest: $serviceRequest" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _keyboardClientMethodCommitCompletionName = 0;
const int _keyboardClientMethodCommitCorrectionName = 1;
const int _keyboardClientMethodCommitTextName = 2;
const int _keyboardClientMethodDeleteSurroundingTextName = 3;
const int _keyboardClientMethodSetComposingRegionName = 4;
const int _keyboardClientMethodSetComposingTextName = 5;
const int _keyboardClientMethodSetSelectionName = 6;
const int _keyboardClientMethodSubmitName = 7;

class _KeyboardClientServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class KeyboardClient {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _KeyboardClientServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static KeyboardClientProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    KeyboardClientProxy p = new KeyboardClientProxy.unbound();
    String name = serviceName ?? KeyboardClient.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void commitCompletion(CompletionData completion);
  void commitCorrection(CorrectionData correction);
  void commitText(String text, int newCursorPosition);
  void deleteSurroundingText(int beforeLength, int afterLength);
  void setComposingRegion(int start, int end);
  void setComposingText(String text, int newCursorPosition);
  void setSelection(int start, int end);
  void submit(SubmitAction action);
}

abstract class KeyboardClientInterface
    implements bindings.MojoInterface<KeyboardClient>,
               KeyboardClient {
  factory KeyboardClientInterface([KeyboardClient impl]) =>
      new KeyboardClientStub.unbound(impl);

  factory KeyboardClientInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [KeyboardClient impl]) =>
      new KeyboardClientStub.fromEndpoint(endpoint, impl);

  factory KeyboardClientInterface.fromMock(
      KeyboardClient mock) =>
      new KeyboardClientProxy.fromMock(mock);
}

abstract class KeyboardClientInterfaceRequest
    implements bindings.MojoInterface<KeyboardClient>,
               KeyboardClient {
  factory KeyboardClientInterfaceRequest() =>
      new KeyboardClientProxy.unbound();
}

class _KeyboardClientProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<KeyboardClient> {
  KeyboardClient impl;

  _KeyboardClientProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _KeyboardClientProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _KeyboardClientProxyControl.unbound() : super.unbound();

  String get serviceName => KeyboardClient.serviceName;

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
    return "_KeyboardClientProxyControl($superString)";
  }
}

class KeyboardClientProxy
    extends bindings.Proxy<KeyboardClient>
    implements KeyboardClient,
               KeyboardClientInterface,
               KeyboardClientInterfaceRequest {
  KeyboardClientProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _KeyboardClientProxyControl.fromEndpoint(endpoint));

  KeyboardClientProxy.fromHandle(core.MojoHandle handle)
      : super(new _KeyboardClientProxyControl.fromHandle(handle));

  KeyboardClientProxy.unbound()
      : super(new _KeyboardClientProxyControl.unbound());

  factory KeyboardClientProxy.fromMock(KeyboardClient mock) {
    KeyboardClientProxy newMockedProxy =
        new KeyboardClientProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static KeyboardClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For KeyboardClientProxy"));
    return new KeyboardClientProxy.fromEndpoint(endpoint);
  }


  void commitCompletion(CompletionData completion) {
    if (impl != null) {
      impl.commitCompletion(completion);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientCommitCompletionParams();
    params.completion = completion;
    ctrl.sendMessage(params,
        _keyboardClientMethodCommitCompletionName);
  }
  void commitCorrection(CorrectionData correction) {
    if (impl != null) {
      impl.commitCorrection(correction);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientCommitCorrectionParams();
    params.correction = correction;
    ctrl.sendMessage(params,
        _keyboardClientMethodCommitCorrectionName);
  }
  void commitText(String text, int newCursorPosition) {
    if (impl != null) {
      impl.commitText(text, newCursorPosition);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientCommitTextParams();
    params.text = text;
    params.newCursorPosition = newCursorPosition;
    ctrl.sendMessage(params,
        _keyboardClientMethodCommitTextName);
  }
  void deleteSurroundingText(int beforeLength, int afterLength) {
    if (impl != null) {
      impl.deleteSurroundingText(beforeLength, afterLength);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientDeleteSurroundingTextParams();
    params.beforeLength = beforeLength;
    params.afterLength = afterLength;
    ctrl.sendMessage(params,
        _keyboardClientMethodDeleteSurroundingTextName);
  }
  void setComposingRegion(int start, int end) {
    if (impl != null) {
      impl.setComposingRegion(start, end);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientSetComposingRegionParams();
    params.start = start;
    params.end = end;
    ctrl.sendMessage(params,
        _keyboardClientMethodSetComposingRegionName);
  }
  void setComposingText(String text, int newCursorPosition) {
    if (impl != null) {
      impl.setComposingText(text, newCursorPosition);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientSetComposingTextParams();
    params.text = text;
    params.newCursorPosition = newCursorPosition;
    ctrl.sendMessage(params,
        _keyboardClientMethodSetComposingTextName);
  }
  void setSelection(int start, int end) {
    if (impl != null) {
      impl.setSelection(start, end);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientSetSelectionParams();
    params.start = start;
    params.end = end;
    ctrl.sendMessage(params,
        _keyboardClientMethodSetSelectionName);
  }
  void submit(SubmitAction action) {
    if (impl != null) {
      impl.submit(action);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardClientSubmitParams();
    params.action = action;
    ctrl.sendMessage(params,
        _keyboardClientMethodSubmitName);
  }
}

class _KeyboardClientStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<KeyboardClient> {
  KeyboardClient _impl;

  _KeyboardClientStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [KeyboardClient impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _KeyboardClientStubControl.fromHandle(
      core.MojoHandle handle, [KeyboardClient impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _KeyboardClientStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => KeyboardClient.serviceName;



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
      case _keyboardClientMethodCommitCompletionName:
        var params = _KeyboardClientCommitCompletionParams.deserialize(
            message.payload);
        _impl.commitCompletion(params.completion);
        break;
      case _keyboardClientMethodCommitCorrectionName:
        var params = _KeyboardClientCommitCorrectionParams.deserialize(
            message.payload);
        _impl.commitCorrection(params.correction);
        break;
      case _keyboardClientMethodCommitTextName:
        var params = _KeyboardClientCommitTextParams.deserialize(
            message.payload);
        _impl.commitText(params.text, params.newCursorPosition);
        break;
      case _keyboardClientMethodDeleteSurroundingTextName:
        var params = _KeyboardClientDeleteSurroundingTextParams.deserialize(
            message.payload);
        _impl.deleteSurroundingText(params.beforeLength, params.afterLength);
        break;
      case _keyboardClientMethodSetComposingRegionName:
        var params = _KeyboardClientSetComposingRegionParams.deserialize(
            message.payload);
        _impl.setComposingRegion(params.start, params.end);
        break;
      case _keyboardClientMethodSetComposingTextName:
        var params = _KeyboardClientSetComposingTextParams.deserialize(
            message.payload);
        _impl.setComposingText(params.text, params.newCursorPosition);
        break;
      case _keyboardClientMethodSetSelectionName:
        var params = _KeyboardClientSetSelectionParams.deserialize(
            message.payload);
        _impl.setSelection(params.start, params.end);
        break;
      case _keyboardClientMethodSubmitName:
        var params = _KeyboardClientSubmitParams.deserialize(
            message.payload);
        _impl.submit(params.action);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  KeyboardClient get impl => _impl;
  set impl(KeyboardClient d) {
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
    return "_KeyboardClientStubControl($superString)";
  }

  int get version => 0;
}

class KeyboardClientStub
    extends bindings.Stub<KeyboardClient>
    implements KeyboardClient,
               KeyboardClientInterface,
               KeyboardClientInterfaceRequest {
  KeyboardClientStub.unbound([KeyboardClient impl])
      : super(new _KeyboardClientStubControl.unbound(impl));

  KeyboardClientStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [KeyboardClient impl])
      : super(new _KeyboardClientStubControl.fromEndpoint(endpoint, impl));

  KeyboardClientStub.fromHandle(
      core.MojoHandle handle, [KeyboardClient impl])
      : super(new _KeyboardClientStubControl.fromHandle(handle, impl));

  static KeyboardClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For KeyboardClientStub"));
    return new KeyboardClientStub.fromEndpoint(endpoint);
  }


  void commitCompletion(CompletionData completion) {
    return impl.commitCompletion(completion);
  }
  void commitCorrection(CorrectionData correction) {
    return impl.commitCorrection(correction);
  }
  void commitText(String text, int newCursorPosition) {
    return impl.commitText(text, newCursorPosition);
  }
  void deleteSurroundingText(int beforeLength, int afterLength) {
    return impl.deleteSurroundingText(beforeLength, afterLength);
  }
  void setComposingRegion(int start, int end) {
    return impl.setComposingRegion(start, end);
  }
  void setComposingText(String text, int newCursorPosition) {
    return impl.setComposingText(text, newCursorPosition);
  }
  void setSelection(int start, int end) {
    return impl.setSelection(start, end);
  }
  void submit(SubmitAction action) {
    return impl.submit(action);
  }
}

const int _keyboardServiceMethodShowName = 0;
const int _keyboardServiceMethodShowByRequestName = 1;
const int _keyboardServiceMethodHideName = 2;
const int _keyboardServiceMethodSetTextName = 3;
const int _keyboardServiceMethodSetSelectionName = 4;

class _KeyboardServiceServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class KeyboardService {
  static const String serviceName = "keyboard::KeyboardService";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _KeyboardServiceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static KeyboardServiceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    KeyboardServiceProxy p = new KeyboardServiceProxy.unbound();
    String name = serviceName ?? KeyboardService.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void show(KeyboardClientInterface client, KeyboardType type);
  void showByRequest();
  void hide();
  void setText(String text);
  void setSelection(int start, int end);
}

abstract class KeyboardServiceInterface
    implements bindings.MojoInterface<KeyboardService>,
               KeyboardService {
  factory KeyboardServiceInterface([KeyboardService impl]) =>
      new KeyboardServiceStub.unbound(impl);

  factory KeyboardServiceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [KeyboardService impl]) =>
      new KeyboardServiceStub.fromEndpoint(endpoint, impl);

  factory KeyboardServiceInterface.fromMock(
      KeyboardService mock) =>
      new KeyboardServiceProxy.fromMock(mock);
}

abstract class KeyboardServiceInterfaceRequest
    implements bindings.MojoInterface<KeyboardService>,
               KeyboardService {
  factory KeyboardServiceInterfaceRequest() =>
      new KeyboardServiceProxy.unbound();
}

class _KeyboardServiceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<KeyboardService> {
  KeyboardService impl;

  _KeyboardServiceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _KeyboardServiceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _KeyboardServiceProxyControl.unbound() : super.unbound();

  String get serviceName => KeyboardService.serviceName;

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
    return "_KeyboardServiceProxyControl($superString)";
  }
}

class KeyboardServiceProxy
    extends bindings.Proxy<KeyboardService>
    implements KeyboardService,
               KeyboardServiceInterface,
               KeyboardServiceInterfaceRequest {
  KeyboardServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _KeyboardServiceProxyControl.fromEndpoint(endpoint));

  KeyboardServiceProxy.fromHandle(core.MojoHandle handle)
      : super(new _KeyboardServiceProxyControl.fromHandle(handle));

  KeyboardServiceProxy.unbound()
      : super(new _KeyboardServiceProxyControl.unbound());

  factory KeyboardServiceProxy.fromMock(KeyboardService mock) {
    KeyboardServiceProxy newMockedProxy =
        new KeyboardServiceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static KeyboardServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For KeyboardServiceProxy"));
    return new KeyboardServiceProxy.fromEndpoint(endpoint);
  }


  void show(KeyboardClientInterface client, KeyboardType type) {
    if (impl != null) {
      impl.show(client, type);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardServiceShowParams();
    params.client = client;
    params.type = type;
    ctrl.sendMessage(params,
        _keyboardServiceMethodShowName);
  }
  void showByRequest() {
    if (impl != null) {
      impl.showByRequest();
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardServiceShowByRequestParams();
    ctrl.sendMessage(params,
        _keyboardServiceMethodShowByRequestName);
  }
  void hide() {
    if (impl != null) {
      impl.hide();
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardServiceHideParams();
    ctrl.sendMessage(params,
        _keyboardServiceMethodHideName);
  }
  void setText(String text) {
    if (impl != null) {
      impl.setText(text);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardServiceSetTextParams();
    params.text = text;
    ctrl.sendMessage(params,
        _keyboardServiceMethodSetTextName);
  }
  void setSelection(int start, int end) {
    if (impl != null) {
      impl.setSelection(start, end);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardServiceSetSelectionParams();
    params.start = start;
    params.end = end;
    ctrl.sendMessage(params,
        _keyboardServiceMethodSetSelectionName);
  }
}

class _KeyboardServiceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<KeyboardService> {
  KeyboardService _impl;

  _KeyboardServiceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [KeyboardService impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _KeyboardServiceStubControl.fromHandle(
      core.MojoHandle handle, [KeyboardService impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _KeyboardServiceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => KeyboardService.serviceName;



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
      case _keyboardServiceMethodShowName:
        var params = _KeyboardServiceShowParams.deserialize(
            message.payload);
        _impl.show(params.client, params.type);
        break;
      case _keyboardServiceMethodShowByRequestName:
        _impl.showByRequest();
        break;
      case _keyboardServiceMethodHideName:
        _impl.hide();
        break;
      case _keyboardServiceMethodSetTextName:
        var params = _KeyboardServiceSetTextParams.deserialize(
            message.payload);
        _impl.setText(params.text);
        break;
      case _keyboardServiceMethodSetSelectionName:
        var params = _KeyboardServiceSetSelectionParams.deserialize(
            message.payload);
        _impl.setSelection(params.start, params.end);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  KeyboardService get impl => _impl;
  set impl(KeyboardService d) {
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
    return "_KeyboardServiceStubControl($superString)";
  }

  int get version => 0;
}

class KeyboardServiceStub
    extends bindings.Stub<KeyboardService>
    implements KeyboardService,
               KeyboardServiceInterface,
               KeyboardServiceInterfaceRequest {
  KeyboardServiceStub.unbound([KeyboardService impl])
      : super(new _KeyboardServiceStubControl.unbound(impl));

  KeyboardServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [KeyboardService impl])
      : super(new _KeyboardServiceStubControl.fromEndpoint(endpoint, impl));

  KeyboardServiceStub.fromHandle(
      core.MojoHandle handle, [KeyboardService impl])
      : super(new _KeyboardServiceStubControl.fromHandle(handle, impl));

  static KeyboardServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For KeyboardServiceStub"));
    return new KeyboardServiceStub.fromEndpoint(endpoint);
  }


  void show(KeyboardClientInterface client, KeyboardType type) {
    return impl.show(client, type);
  }
  void showByRequest() {
    return impl.showByRequest();
  }
  void hide() {
    return impl.hide();
  }
  void setText(String text) {
    return impl.setText(text);
  }
  void setSelection(int start, int end) {
    return impl.setSelection(start, end);
  }
}

const int _keyboardServiceFactoryMethodCreateKeyboardServiceName = 0;

class _KeyboardServiceFactoryServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class KeyboardServiceFactory {
  static const String serviceName = "keyboard::KeyboardServiceFactory";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _KeyboardServiceFactoryServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static KeyboardServiceFactoryProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    KeyboardServiceFactoryProxy p = new KeyboardServiceFactoryProxy.unbound();
    String name = serviceName ?? KeyboardServiceFactory.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void createKeyboardService(native_viewport_event_dispatcher_mojom.NativeViewportEventDispatcherInterfaceRequest keyEventDispatcher, KeyboardServiceInterfaceRequest serviceRequest);
}

abstract class KeyboardServiceFactoryInterface
    implements bindings.MojoInterface<KeyboardServiceFactory>,
               KeyboardServiceFactory {
  factory KeyboardServiceFactoryInterface([KeyboardServiceFactory impl]) =>
      new KeyboardServiceFactoryStub.unbound(impl);

  factory KeyboardServiceFactoryInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [KeyboardServiceFactory impl]) =>
      new KeyboardServiceFactoryStub.fromEndpoint(endpoint, impl);

  factory KeyboardServiceFactoryInterface.fromMock(
      KeyboardServiceFactory mock) =>
      new KeyboardServiceFactoryProxy.fromMock(mock);
}

abstract class KeyboardServiceFactoryInterfaceRequest
    implements bindings.MojoInterface<KeyboardServiceFactory>,
               KeyboardServiceFactory {
  factory KeyboardServiceFactoryInterfaceRequest() =>
      new KeyboardServiceFactoryProxy.unbound();
}

class _KeyboardServiceFactoryProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<KeyboardServiceFactory> {
  KeyboardServiceFactory impl;

  _KeyboardServiceFactoryProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _KeyboardServiceFactoryProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _KeyboardServiceFactoryProxyControl.unbound() : super.unbound();

  String get serviceName => KeyboardServiceFactory.serviceName;

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
    return "_KeyboardServiceFactoryProxyControl($superString)";
  }
}

class KeyboardServiceFactoryProxy
    extends bindings.Proxy<KeyboardServiceFactory>
    implements KeyboardServiceFactory,
               KeyboardServiceFactoryInterface,
               KeyboardServiceFactoryInterfaceRequest {
  KeyboardServiceFactoryProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _KeyboardServiceFactoryProxyControl.fromEndpoint(endpoint));

  KeyboardServiceFactoryProxy.fromHandle(core.MojoHandle handle)
      : super(new _KeyboardServiceFactoryProxyControl.fromHandle(handle));

  KeyboardServiceFactoryProxy.unbound()
      : super(new _KeyboardServiceFactoryProxyControl.unbound());

  factory KeyboardServiceFactoryProxy.fromMock(KeyboardServiceFactory mock) {
    KeyboardServiceFactoryProxy newMockedProxy =
        new KeyboardServiceFactoryProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static KeyboardServiceFactoryProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For KeyboardServiceFactoryProxy"));
    return new KeyboardServiceFactoryProxy.fromEndpoint(endpoint);
  }


  void createKeyboardService(native_viewport_event_dispatcher_mojom.NativeViewportEventDispatcherInterfaceRequest keyEventDispatcher, KeyboardServiceInterfaceRequest serviceRequest) {
    if (impl != null) {
      impl.createKeyboardService(keyEventDispatcher, serviceRequest);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _KeyboardServiceFactoryCreateKeyboardServiceParams();
    params.keyEventDispatcher = keyEventDispatcher;
    params.serviceRequest = serviceRequest;
    ctrl.sendMessage(params,
        _keyboardServiceFactoryMethodCreateKeyboardServiceName);
  }
}

class _KeyboardServiceFactoryStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<KeyboardServiceFactory> {
  KeyboardServiceFactory _impl;

  _KeyboardServiceFactoryStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [KeyboardServiceFactory impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _KeyboardServiceFactoryStubControl.fromHandle(
      core.MojoHandle handle, [KeyboardServiceFactory impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _KeyboardServiceFactoryStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => KeyboardServiceFactory.serviceName;



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
      case _keyboardServiceFactoryMethodCreateKeyboardServiceName:
        var params = _KeyboardServiceFactoryCreateKeyboardServiceParams.deserialize(
            message.payload);
        _impl.createKeyboardService(params.keyEventDispatcher, params.serviceRequest);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  KeyboardServiceFactory get impl => _impl;
  set impl(KeyboardServiceFactory d) {
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
    return "_KeyboardServiceFactoryStubControl($superString)";
  }

  int get version => 0;
}

class KeyboardServiceFactoryStub
    extends bindings.Stub<KeyboardServiceFactory>
    implements KeyboardServiceFactory,
               KeyboardServiceFactoryInterface,
               KeyboardServiceFactoryInterfaceRequest {
  KeyboardServiceFactoryStub.unbound([KeyboardServiceFactory impl])
      : super(new _KeyboardServiceFactoryStubControl.unbound(impl));

  KeyboardServiceFactoryStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [KeyboardServiceFactory impl])
      : super(new _KeyboardServiceFactoryStubControl.fromEndpoint(endpoint, impl));

  KeyboardServiceFactoryStub.fromHandle(
      core.MojoHandle handle, [KeyboardServiceFactory impl])
      : super(new _KeyboardServiceFactoryStubControl.fromHandle(handle, impl));

  static KeyboardServiceFactoryStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For KeyboardServiceFactoryStub"));
    return new KeyboardServiceFactoryStub.fromEndpoint(endpoint);
  }


  void createKeyboardService(native_viewport_event_dispatcher_mojom.NativeViewportEventDispatcherInterfaceRequest keyEventDispatcher, KeyboardServiceInterfaceRequest serviceRequest) {
    return impl.createKeyboardService(keyEventDispatcher, serviceRequest);
  }
}



