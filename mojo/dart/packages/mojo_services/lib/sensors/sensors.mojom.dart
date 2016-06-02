// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library sensors_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;

class SensorType extends bindings.MojoEnum {
  static const SensorType accelerometer = const SensorType._(0);
  static const SensorType ambientTemperature = const SensorType._(1);
  static const SensorType gameRotationVector = const SensorType._(2);
  static const SensorType geomagneticRotationVector = const SensorType._(3);
  static const SensorType gravity = const SensorType._(4);
  static const SensorType gyroscope = const SensorType._(5);
  static const SensorType gyroscopeUncalibrated = const SensorType._(6);
  static const SensorType heartRate = const SensorType._(7);
  static const SensorType light = const SensorType._(8);
  static const SensorType linearAcceleration = const SensorType._(9);
  static const SensorType magneticField = const SensorType._(10);
  static const SensorType magneticFieldUncalibrated = const SensorType._(11);
  static const SensorType pressure = const SensorType._(12);
  static const SensorType proximity = const SensorType._(13);
  static const SensorType relativeHumidity = const SensorType._(14);
  static const SensorType rotationVector = const SensorType._(15);
  static const SensorType significantMotion = const SensorType._(16);
  static const SensorType stepCounter = const SensorType._(17);
  static const SensorType stepDetector = const SensorType._(18);

  const SensorType._(int v) : super(v);

  static const Map<String, SensorType> valuesMap = const {
    "accelerometer": accelerometer,
    "ambientTemperature": ambientTemperature,
    "gameRotationVector": gameRotationVector,
    "geomagneticRotationVector": geomagneticRotationVector,
    "gravity": gravity,
    "gyroscope": gyroscope,
    "gyroscopeUncalibrated": gyroscopeUncalibrated,
    "heartRate": heartRate,
    "light": light,
    "linearAcceleration": linearAcceleration,
    "magneticField": magneticField,
    "magneticFieldUncalibrated": magneticFieldUncalibrated,
    "pressure": pressure,
    "proximity": proximity,
    "relativeHumidity": relativeHumidity,
    "rotationVector": rotationVector,
    "significantMotion": significantMotion,
    "stepCounter": stepCounter,
    "stepDetector": stepDetector,
  };
  static const List<SensorType> values = const [
    accelerometer,
    ambientTemperature,
    gameRotationVector,
    geomagneticRotationVector,
    gravity,
    gyroscope,
    gyroscopeUncalibrated,
    heartRate,
    light,
    linearAcceleration,
    magneticField,
    magneticFieldUncalibrated,
    pressure,
    proximity,
    relativeHumidity,
    rotationVector,
    significantMotion,
    stepCounter,
    stepDetector,
  ];

  static SensorType valueOf(String name) => valuesMap[name];

  factory SensorType(int v) {
    switch (v) {
      case 0:
        return SensorType.accelerometer;
      case 1:
        return SensorType.ambientTemperature;
      case 2:
        return SensorType.gameRotationVector;
      case 3:
        return SensorType.geomagneticRotationVector;
      case 4:
        return SensorType.gravity;
      case 5:
        return SensorType.gyroscope;
      case 6:
        return SensorType.gyroscopeUncalibrated;
      case 7:
        return SensorType.heartRate;
      case 8:
        return SensorType.light;
      case 9:
        return SensorType.linearAcceleration;
      case 10:
        return SensorType.magneticField;
      case 11:
        return SensorType.magneticFieldUncalibrated;
      case 12:
        return SensorType.pressure;
      case 13:
        return SensorType.proximity;
      case 14:
        return SensorType.relativeHumidity;
      case 15:
        return SensorType.rotationVector;
      case 16:
        return SensorType.significantMotion;
      case 17:
        return SensorType.stepCounter;
      case 18:
        return SensorType.stepDetector;
      default:
        return null;
    }
  }

  static SensorType decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    SensorType result = new SensorType(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum SensorType.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case accelerometer:
        return 'SensorType.accelerometer';
      case ambientTemperature:
        return 'SensorType.ambientTemperature';
      case gameRotationVector:
        return 'SensorType.gameRotationVector';
      case geomagneticRotationVector:
        return 'SensorType.geomagneticRotationVector';
      case gravity:
        return 'SensorType.gravity';
      case gyroscope:
        return 'SensorType.gyroscope';
      case gyroscopeUncalibrated:
        return 'SensorType.gyroscopeUncalibrated';
      case heartRate:
        return 'SensorType.heartRate';
      case light:
        return 'SensorType.light';
      case linearAcceleration:
        return 'SensorType.linearAcceleration';
      case magneticField:
        return 'SensorType.magneticField';
      case magneticFieldUncalibrated:
        return 'SensorType.magneticFieldUncalibrated';
      case pressure:
        return 'SensorType.pressure';
      case proximity:
        return 'SensorType.proximity';
      case relativeHumidity:
        return 'SensorType.relativeHumidity';
      case rotationVector:
        return 'SensorType.rotationVector';
      case significantMotion:
        return 'SensorType.significantMotion';
      case stepCounter:
        return 'SensorType.stepCounter';
      case stepDetector:
        return 'SensorType.stepDetector';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}



class SensorData extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  int accuracy = 0;
  int timeStamp = 0;
  List<double> values = null;

  SensorData() : super(kVersions.last.size);

  static SensorData deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SensorData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SensorData result = new SensorData();

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
      
      result.accuracy = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.timeStamp = decoder0.decodeInt64(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.values = decoder0.decodeFloatArray(24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(accuracy, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "accuracy of struct SensorData: $e";
      rethrow;
    }
    try {
      encoder0.encodeInt64(timeStamp, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "timeStamp of struct SensorData: $e";
      rethrow;
    }
    try {
      encoder0.encodeFloatArray(values, 24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "values of struct SensorData: $e";
      rethrow;
    }
  }

  String toString() {
    return "SensorData("
           "accuracy: $accuracy" ", "
           "timeStamp: $timeStamp" ", "
           "values: $values" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["accuracy"] = accuracy;
    map["timeStamp"] = timeStamp;
    map["values"] = values;
    return map;
  }
}


class _SensorListenerOnAccuracyChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int accuracy = 0;

  _SensorListenerOnAccuracyChangedParams() : super(kVersions.last.size);

  static _SensorListenerOnAccuracyChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SensorListenerOnAccuracyChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SensorListenerOnAccuracyChangedParams result = new _SensorListenerOnAccuracyChangedParams();

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
      
      result.accuracy = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(accuracy, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "accuracy of struct _SensorListenerOnAccuracyChangedParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_SensorListenerOnAccuracyChangedParams("
           "accuracy: $accuracy" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["accuracy"] = accuracy;
    return map;
  }
}


class _SensorListenerOnSensorChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  SensorData data = null;

  _SensorListenerOnSensorChangedParams() : super(kVersions.last.size);

  static _SensorListenerOnSensorChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SensorListenerOnSensorChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SensorListenerOnSensorChangedParams result = new _SensorListenerOnSensorChangedParams();

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
      result.data = SensorData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(data, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "data of struct _SensorListenerOnSensorChangedParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_SensorListenerOnSensorChangedParams("
           "data: $data" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["data"] = data;
    return map;
  }
}


class _SensorServiceAddListenerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  SensorType type = null;
  SensorListenerInterface listener = null;

  _SensorServiceAddListenerParams() : super(kVersions.last.size);

  static _SensorServiceAddListenerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SensorServiceAddListenerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SensorServiceAddListenerParams result = new _SensorServiceAddListenerParams();

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
      
        result.type = SensorType.decode(decoder0, 8);
        if (result.type == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable SensorType.');
        }
    }
    if (mainDataHeader.version >= 0) {
      
      result.listener = decoder0.decodeServiceInterface(12, false, SensorListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeEnum(type, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "type of struct _SensorServiceAddListenerParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInterface(listener, 12, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "listener of struct _SensorServiceAddListenerParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_SensorServiceAddListenerParams("
           "type: $type" ", "
           "listener: $listener" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _sensorListenerMethodOnAccuracyChangedName = 0;
const int _sensorListenerMethodOnSensorChangedName = 1;

class _SensorListenerServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class SensorListener {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _SensorListenerServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static SensorListenerProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    SensorListenerProxy p = new SensorListenerProxy.unbound();
    String name = serviceName ?? SensorListener.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void onAccuracyChanged(int accuracy);
  void onSensorChanged(SensorData data);
}

abstract class SensorListenerInterface
    implements bindings.MojoInterface<SensorListener>,
               SensorListener {
  factory SensorListenerInterface([SensorListener impl]) =>
      new SensorListenerStub.unbound(impl);

  factory SensorListenerInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [SensorListener impl]) =>
      new SensorListenerStub.fromEndpoint(endpoint, impl);

  factory SensorListenerInterface.fromMock(
      SensorListener mock) =>
      new SensorListenerProxy.fromMock(mock);
}

abstract class SensorListenerInterfaceRequest
    implements bindings.MojoInterface<SensorListener>,
               SensorListener {
  factory SensorListenerInterfaceRequest() =>
      new SensorListenerProxy.unbound();
}

class _SensorListenerProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<SensorListener> {
  SensorListener impl;

  _SensorListenerProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _SensorListenerProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _SensorListenerProxyControl.unbound() : super.unbound();

  String get serviceName => SensorListener.serviceName;

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
    return "_SensorListenerProxyControl($superString)";
  }
}

class SensorListenerProxy
    extends bindings.Proxy<SensorListener>
    implements SensorListener,
               SensorListenerInterface,
               SensorListenerInterfaceRequest {
  SensorListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _SensorListenerProxyControl.fromEndpoint(endpoint));

  SensorListenerProxy.fromHandle(core.MojoHandle handle)
      : super(new _SensorListenerProxyControl.fromHandle(handle));

  SensorListenerProxy.unbound()
      : super(new _SensorListenerProxyControl.unbound());

  factory SensorListenerProxy.fromMock(SensorListener mock) {
    SensorListenerProxy newMockedProxy =
        new SensorListenerProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static SensorListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorListenerProxy"));
    return new SensorListenerProxy.fromEndpoint(endpoint);
  }


  void onAccuracyChanged(int accuracy) {
    if (impl != null) {
      impl.onAccuracyChanged(accuracy);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _SensorListenerOnAccuracyChangedParams();
    params.accuracy = accuracy;
    ctrl.sendMessage(params,
        _sensorListenerMethodOnAccuracyChangedName);
  }
  void onSensorChanged(SensorData data) {
    if (impl != null) {
      impl.onSensorChanged(data);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _SensorListenerOnSensorChangedParams();
    params.data = data;
    ctrl.sendMessage(params,
        _sensorListenerMethodOnSensorChangedName);
  }
}

class _SensorListenerStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<SensorListener> {
  SensorListener _impl;

  _SensorListenerStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [SensorListener impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _SensorListenerStubControl.fromHandle(
      core.MojoHandle handle, [SensorListener impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _SensorListenerStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => SensorListener.serviceName;



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
      case _sensorListenerMethodOnAccuracyChangedName:
        var params = _SensorListenerOnAccuracyChangedParams.deserialize(
            message.payload);
        _impl.onAccuracyChanged(params.accuracy);
        break;
      case _sensorListenerMethodOnSensorChangedName:
        var params = _SensorListenerOnSensorChangedParams.deserialize(
            message.payload);
        _impl.onSensorChanged(params.data);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  SensorListener get impl => _impl;
  set impl(SensorListener d) {
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
    return "_SensorListenerStubControl($superString)";
  }

  int get version => 0;
}

class SensorListenerStub
    extends bindings.Stub<SensorListener>
    implements SensorListener,
               SensorListenerInterface,
               SensorListenerInterfaceRequest {
  SensorListenerStub.unbound([SensorListener impl])
      : super(new _SensorListenerStubControl.unbound(impl));

  SensorListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [SensorListener impl])
      : super(new _SensorListenerStubControl.fromEndpoint(endpoint, impl));

  SensorListenerStub.fromHandle(
      core.MojoHandle handle, [SensorListener impl])
      : super(new _SensorListenerStubControl.fromHandle(handle, impl));

  static SensorListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorListenerStub"));
    return new SensorListenerStub.fromEndpoint(endpoint);
  }


  void onAccuracyChanged(int accuracy) {
    return impl.onAccuracyChanged(accuracy);
  }
  void onSensorChanged(SensorData data) {
    return impl.onSensorChanged(data);
  }
}

const int _sensorServiceMethodAddListenerName = 0;

class _SensorServiceServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class SensorService {
  static const String serviceName = "sensors::SensorService";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _SensorServiceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static SensorServiceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    SensorServiceProxy p = new SensorServiceProxy.unbound();
    String name = serviceName ?? SensorService.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void addListener(SensorType type, SensorListenerInterface listener);
}

abstract class SensorServiceInterface
    implements bindings.MojoInterface<SensorService>,
               SensorService {
  factory SensorServiceInterface([SensorService impl]) =>
      new SensorServiceStub.unbound(impl);

  factory SensorServiceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [SensorService impl]) =>
      new SensorServiceStub.fromEndpoint(endpoint, impl);

  factory SensorServiceInterface.fromMock(
      SensorService mock) =>
      new SensorServiceProxy.fromMock(mock);
}

abstract class SensorServiceInterfaceRequest
    implements bindings.MojoInterface<SensorService>,
               SensorService {
  factory SensorServiceInterfaceRequest() =>
      new SensorServiceProxy.unbound();
}

class _SensorServiceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<SensorService> {
  SensorService impl;

  _SensorServiceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _SensorServiceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _SensorServiceProxyControl.unbound() : super.unbound();

  String get serviceName => SensorService.serviceName;

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
    return "_SensorServiceProxyControl($superString)";
  }
}

class SensorServiceProxy
    extends bindings.Proxy<SensorService>
    implements SensorService,
               SensorServiceInterface,
               SensorServiceInterfaceRequest {
  SensorServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _SensorServiceProxyControl.fromEndpoint(endpoint));

  SensorServiceProxy.fromHandle(core.MojoHandle handle)
      : super(new _SensorServiceProxyControl.fromHandle(handle));

  SensorServiceProxy.unbound()
      : super(new _SensorServiceProxyControl.unbound());

  factory SensorServiceProxy.fromMock(SensorService mock) {
    SensorServiceProxy newMockedProxy =
        new SensorServiceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static SensorServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorServiceProxy"));
    return new SensorServiceProxy.fromEndpoint(endpoint);
  }


  void addListener(SensorType type, SensorListenerInterface listener) {
    if (impl != null) {
      impl.addListener(type, listener);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _SensorServiceAddListenerParams();
    params.type = type;
    params.listener = listener;
    ctrl.sendMessage(params,
        _sensorServiceMethodAddListenerName);
  }
}

class _SensorServiceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<SensorService> {
  SensorService _impl;

  _SensorServiceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [SensorService impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _SensorServiceStubControl.fromHandle(
      core.MojoHandle handle, [SensorService impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _SensorServiceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => SensorService.serviceName;



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
      case _sensorServiceMethodAddListenerName:
        var params = _SensorServiceAddListenerParams.deserialize(
            message.payload);
        _impl.addListener(params.type, params.listener);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  SensorService get impl => _impl;
  set impl(SensorService d) {
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
    return "_SensorServiceStubControl($superString)";
  }

  int get version => 0;
}

class SensorServiceStub
    extends bindings.Stub<SensorService>
    implements SensorService,
               SensorServiceInterface,
               SensorServiceInterfaceRequest {
  SensorServiceStub.unbound([SensorService impl])
      : super(new _SensorServiceStubControl.unbound(impl));

  SensorServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [SensorService impl])
      : super(new _SensorServiceStubControl.fromEndpoint(endpoint, impl));

  SensorServiceStub.fromHandle(
      core.MojoHandle handle, [SensorService impl])
      : super(new _SensorServiceStubControl.fromHandle(handle, impl));

  static SensorServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorServiceStub"));
    return new SensorServiceStub.fromEndpoint(endpoint);
  }


  void addListener(SensorType type, SensorListenerInterface listener) {
    return impl.addListener(type, listener);
  }
}



