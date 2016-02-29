// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library media_common_mojom;
import 'package:mojo/bindings.dart' as bindings;


class MediaResult extends bindings.MojoEnum {
  static const MediaResult ok = const MediaResult._(0);
  static const MediaResult unknownError = const MediaResult._(-1);
  static const MediaResult internalError = const MediaResult._(-2);
  static const MediaResult notImplemented = const MediaResult._(-3);
  static const MediaResult unsupportedOperation = const MediaResult._(-4);
  static const MediaResult unsupportedConfig = const MediaResult._(-5);
  static const MediaResult invalidArgument = const MediaResult._(-6);
  static const MediaResult insufficientResources = const MediaResult._(-7);
  static const MediaResult badState = const MediaResult._(-8);
  static const MediaResult bufOverflow = const MediaResult._(-9);
  static const MediaResult flushed = const MediaResult._(-10);
  static const MediaResult busy = const MediaResult._(-11);
  static const MediaResult protocolError = const MediaResult._(-12);
  static const MediaResult alreadyExists = const MediaResult._(-13);
  static const MediaResult notFound = const MediaResult._(-14);
  static const MediaResult shuttingDown = const MediaResult._(-15);
  static const MediaResult connectionLost = const MediaResult._(-16);

  const MediaResult._(int v) : super(v);

  static const Map<String, MediaResult> valuesMap = const {
    "ok": ok,
    "unknownError": unknownError,
    "internalError": internalError,
    "notImplemented": notImplemented,
    "unsupportedOperation": unsupportedOperation,
    "unsupportedConfig": unsupportedConfig,
    "invalidArgument": invalidArgument,
    "insufficientResources": insufficientResources,
    "badState": badState,
    "bufOverflow": bufOverflow,
    "flushed": flushed,
    "busy": busy,
    "protocolError": protocolError,
    "alreadyExists": alreadyExists,
    "notFound": notFound,
    "shuttingDown": shuttingDown,
    "connectionLost": connectionLost,
  };
  static const List<MediaResult> values = const [
    ok,
    unknownError,
    internalError,
    notImplemented,
    unsupportedOperation,
    unsupportedConfig,
    invalidArgument,
    insufficientResources,
    badState,
    bufOverflow,
    flushed,
    busy,
    protocolError,
    alreadyExists,
    notFound,
    shuttingDown,
    connectionLost,
  ];

  static MediaResult valueOf(String name) => valuesMap[name];

  factory MediaResult(int v) {
    switch (v) {
      case 0:
        return MediaResult.ok;
      case -1:
        return MediaResult.unknownError;
      case -2:
        return MediaResult.internalError;
      case -3:
        return MediaResult.notImplemented;
      case -4:
        return MediaResult.unsupportedOperation;
      case -5:
        return MediaResult.unsupportedConfig;
      case -6:
        return MediaResult.invalidArgument;
      case -7:
        return MediaResult.insufficientResources;
      case -8:
        return MediaResult.badState;
      case -9:
        return MediaResult.bufOverflow;
      case -10:
        return MediaResult.flushed;
      case -11:
        return MediaResult.busy;
      case -12:
        return MediaResult.protocolError;
      case -13:
        return MediaResult.alreadyExists;
      case -14:
        return MediaResult.notFound;
      case -15:
        return MediaResult.shuttingDown;
      case -16:
        return MediaResult.connectionLost;
      default:
        return null;
    }
  }

  static MediaResult decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    MediaResult result = new MediaResult(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum MediaResult.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case ok:
        return 'MediaResult.ok';
      case unknownError:
        return 'MediaResult.unknownError';
      case internalError:
        return 'MediaResult.internalError';
      case notImplemented:
        return 'MediaResult.notImplemented';
      case unsupportedOperation:
        return 'MediaResult.unsupportedOperation';
      case unsupportedConfig:
        return 'MediaResult.unsupportedConfig';
      case invalidArgument:
        return 'MediaResult.invalidArgument';
      case insufficientResources:
        return 'MediaResult.insufficientResources';
      case badState:
        return 'MediaResult.badState';
      case bufOverflow:
        return 'MediaResult.bufOverflow';
      case flushed:
        return 'MediaResult.flushed';
      case busy:
        return 'MediaResult.busy';
      case protocolError:
        return 'MediaResult.protocolError';
      case alreadyExists:
        return 'MediaResult.alreadyExists';
      case notFound:
        return 'MediaResult.notFound';
      case shuttingDown:
        return 'MediaResult.shuttingDown';
      case connectionLost:
        return 'MediaResult.connectionLost';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}







