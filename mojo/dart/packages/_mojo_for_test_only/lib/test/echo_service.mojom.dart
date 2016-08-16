// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library echo_service_mojom;
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/mojom_types.mojom.dart' as mojom_types;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



class _EchoServiceEchoStringParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String value = null;

  _EchoServiceEchoStringParams() : super(kVersions.last.size);

  _EchoServiceEchoStringParams.init(
    String this.value
  ) : super(kVersions.last.size);

  static _EchoServiceEchoStringParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _EchoServiceEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _EchoServiceEchoStringParams result = new _EchoServiceEchoStringParams();
    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_EchoServiceEchoStringParams";
    String fieldName;
    try {
      fieldName = "value";
      encoder0.encodeString(value, 8, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_EchoServiceEchoStringParams("
           "value: $value" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["value"] = value;
    return map;
  }
}


class EchoServiceEchoStringResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String value = null;

  EchoServiceEchoStringResponseParams() : super(kVersions.last.size);

  EchoServiceEchoStringResponseParams.init(
    String this.value
  ) : super(kVersions.last.size);

  static EchoServiceEchoStringResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static EchoServiceEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceEchoStringResponseParams result = new EchoServiceEchoStringResponseParams();
    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "EchoServiceEchoStringResponseParams";
    String fieldName;
    try {
      fieldName = "value";
      encoder0.encodeString(value, 8, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "EchoServiceEchoStringResponseParams("
           "value: $value" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["value"] = value;
    return map;
  }
}


class _EchoServiceDelayedEchoStringParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String value = null;
  int millis = 0;

  _EchoServiceDelayedEchoStringParams() : super(kVersions.last.size);

  _EchoServiceDelayedEchoStringParams.init(
    String this.value, 
    int this.millis
  ) : super(kVersions.last.size);

  static _EchoServiceDelayedEchoStringParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _EchoServiceDelayedEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _EchoServiceDelayedEchoStringParams result = new _EchoServiceDelayedEchoStringParams();
    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(8, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.millis = decoder0.decodeInt32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_EchoServiceDelayedEchoStringParams";
    String fieldName;
    try {
      fieldName = "value";
      encoder0.encodeString(value, 8, true);
      fieldName = "millis";
      encoder0.encodeInt32(millis, 16);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_EchoServiceDelayedEchoStringParams("
           "value: $value" ", "
           "millis: $millis" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["value"] = value;
    map["millis"] = millis;
    return map;
  }
}


class EchoServiceDelayedEchoStringResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String value = null;

  EchoServiceDelayedEchoStringResponseParams() : super(kVersions.last.size);

  EchoServiceDelayedEchoStringResponseParams.init(
    String this.value
  ) : super(kVersions.last.size);

  static EchoServiceDelayedEchoStringResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static EchoServiceDelayedEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceDelayedEchoStringResponseParams result = new EchoServiceDelayedEchoStringResponseParams();
    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "EchoServiceDelayedEchoStringResponseParams";
    String fieldName;
    try {
      fieldName = "value";
      encoder0.encodeString(value, 8, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "EchoServiceDelayedEchoStringResponseParams("
           "value: $value" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["value"] = value;
    return map;
  }
}


class _EchoServiceSwapParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _EchoServiceSwapParams() : super(kVersions.last.size);

  _EchoServiceSwapParams.init(
  ) : super(kVersions.last.size);

  static _EchoServiceSwapParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _EchoServiceSwapParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _EchoServiceSwapParams result = new _EchoServiceSwapParams();
    bindings.Struct.checkVersion(decoder0, kVersions);
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_EchoServiceSwapParams";
    String fieldName;
    try {
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_EchoServiceSwapParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _EchoServiceQuitParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _EchoServiceQuitParams() : super(kVersions.last.size);

  _EchoServiceQuitParams.init(
  ) : super(kVersions.last.size);

  static _EchoServiceQuitParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _EchoServiceQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _EchoServiceQuitParams result = new _EchoServiceQuitParams();
    bindings.Struct.checkVersion(decoder0, kVersions);
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_EchoServiceQuitParams";
    String fieldName;
    try {
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_EchoServiceQuitParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}

const int _echoServiceMethodEchoStringName = 0;
const int _echoServiceMethodDelayedEchoStringName = 1;
const int _echoServiceMethodSwapName = 2;
const int _echoServiceMethodQuitName = 3;

class _EchoServiceServiceDescription implements service_describer.ServiceDescription {
  void getTopLevelInterface(Function responder){
    var interfaceTypeKey = getRuntimeTypeInfo().services["test::EchoService"];
    var userDefinedType = getAllMojomTypeDefinitions()[interfaceTypeKey];
    responder(userDefinedType.interfaceType);
  }

  void getTypeDefinition(String typeKey, Function responder) {
    responder(getAllMojomTypeDefinitions()[typeKey]);
  }

  void getAllTypeDefinitions(Function responder) {
    responder(getAllMojomTypeDefinitions());
  }
}

abstract class EchoService {
  static const String serviceName = "test::EchoService";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _EchoServiceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static EchoServiceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    EchoServiceProxy p = new EchoServiceProxy.unbound();
    String name = serviceName ?? EchoService.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void echoString(String value,void callback(String value));
  void delayedEchoString(String value,int millis,void callback(String value));
  void swap();
  void quit();
}

abstract class EchoServiceInterface
    implements bindings.MojoInterface<EchoService>,
               EchoService {
  factory EchoServiceInterface([EchoService impl]) =>
      new EchoServiceStub.unbound(impl);

  factory EchoServiceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [EchoService impl]) =>
      new EchoServiceStub.fromEndpoint(endpoint, impl);

  factory EchoServiceInterface.fromMock(
      EchoService mock) =>
      new EchoServiceProxy.fromMock(mock);
}

abstract class EchoServiceInterfaceRequest
    implements bindings.MojoInterface<EchoService>,
               EchoService {
  factory EchoServiceInterfaceRequest() =>
      new EchoServiceProxy.unbound();
}

class _EchoServiceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<EchoService> {
  EchoService impl;

  _EchoServiceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _EchoServiceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _EchoServiceProxyControl.unbound() : super.unbound();

  String get serviceName => EchoService.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _echoServiceMethodEchoStringName:
        Function callback = getCallback(message);
        if (callback != null) {
          var r = EchoServiceEchoStringResponseParams.deserialize(
              message.payload);
          callback(r.value );
        }
        break;
      case _echoServiceMethodDelayedEchoStringName:
        Function callback = getCallback(message);
        if (callback != null) {
          var r = EchoServiceDelayedEchoStringResponseParams.deserialize(
              message.payload);
          callback(r.value );
        }
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
    return "_EchoServiceProxyControl($superString)";
  }
}

class EchoServiceProxy
    extends bindings.Proxy<EchoService>
    implements EchoService,
               EchoServiceInterface,
               EchoServiceInterfaceRequest {
  EchoServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _EchoServiceProxyControl.fromEndpoint(endpoint));

  EchoServiceProxy.fromHandle(core.MojoHandle handle)
      : super(new _EchoServiceProxyControl.fromHandle(handle));

  EchoServiceProxy.unbound()
      : super(new _EchoServiceProxyControl.unbound());

  factory EchoServiceProxy.fromMock(EchoService mock) {
    EchoServiceProxy newMockedProxy =
        new EchoServiceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static EchoServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For EchoServiceProxy"));
    return new EchoServiceProxy.fromEndpoint(endpoint);
  }


  void echoString(String value,void callback(String value)) {
    if (impl != null) {
      impl.echoString(value,callback ?? bindings.DoNothingFunction.fn);
      return;
    }
    var params = new _EchoServiceEchoStringParams();
    params.value = value;
    Function zonedCallback;
    if ((callback == null) || identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((String value) {
        z.bindCallback(() {
          callback(value);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _echoServiceMethodEchoStringName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void delayedEchoString(String value,int millis,void callback(String value)) {
    if (impl != null) {
      impl.delayedEchoString(value,millis,callback ?? bindings.DoNothingFunction.fn);
      return;
    }
    var params = new _EchoServiceDelayedEchoStringParams();
    params.value = value;
    params.millis = millis;
    Function zonedCallback;
    if ((callback == null) || identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((String value) {
        z.bindCallback(() {
          callback(value);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _echoServiceMethodDelayedEchoStringName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void swap() {
    if (impl != null) {
      impl.swap();
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _EchoServiceSwapParams();
    ctrl.sendMessage(params,
        _echoServiceMethodSwapName);
  }
  void quit() {
    if (impl != null) {
      impl.quit();
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _EchoServiceQuitParams();
    ctrl.sendMessage(params,
        _echoServiceMethodQuitName);
  }
}

class _EchoServiceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<EchoService> {
  EchoService _impl;

  _EchoServiceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [EchoService impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _EchoServiceStubControl.fromHandle(
      core.MojoHandle handle, [EchoService impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _EchoServiceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => EchoService.serviceName;


  Function _echoServiceEchoStringResponseParamsResponder(
      int requestId) {
  return (String value) {
      var result = new EchoServiceEchoStringResponseParams();
      result.value = value;
      sendResponse(buildResponseWithId(
          result,
          _echoServiceMethodEchoStringName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }
  Function _echoServiceDelayedEchoStringResponseParamsResponder(
      int requestId) {
  return (String value) {
      var result = new EchoServiceDelayedEchoStringResponseParams();
      result.value = value;
      sendResponse(buildResponseWithId(
          result,
          _echoServiceMethodDelayedEchoStringName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }

  void handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      bindings.ControlMessageHandler.handleMessage(
          this, 0, message);
      return;
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _echoServiceMethodEchoStringName:
        var params = _EchoServiceEchoStringParams.deserialize(
            message.payload);
        _impl.echoString(params.value, _echoServiceEchoStringResponseParamsResponder(message.header.requestId));
        break;
      case _echoServiceMethodDelayedEchoStringName:
        var params = _EchoServiceDelayedEchoStringParams.deserialize(
            message.payload);
        _impl.delayedEchoString(params.value, params.millis, _echoServiceDelayedEchoStringResponseParamsResponder(message.header.requestId));
        break;
      case _echoServiceMethodSwapName:
        _impl.swap();
        break;
      case _echoServiceMethodQuitName:
        _impl.quit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  EchoService get impl => _impl;
  set impl(EchoService d) {
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
    return "_EchoServiceStubControl($superString)";
  }

  int get version => 0;
}

class EchoServiceStub
    extends bindings.Stub<EchoService>
    implements EchoService,
               EchoServiceInterface,
               EchoServiceInterfaceRequest {
  EchoServiceStub.unbound([EchoService impl])
      : super(new _EchoServiceStubControl.unbound(impl));

  EchoServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [EchoService impl])
      : super(new _EchoServiceStubControl.fromEndpoint(endpoint, impl));

  EchoServiceStub.fromHandle(
      core.MojoHandle handle, [EchoService impl])
      : super(new _EchoServiceStubControl.fromHandle(handle, impl));

  static EchoServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For EchoServiceStub"));
    return new EchoServiceStub.fromEndpoint(endpoint);
  }


  void echoString(String value,void callback(String value)) {
    return impl.echoString(value,callback);
  }
  void delayedEchoString(String value,int millis,void callback(String value)) {
    return impl.delayedEchoString(value,millis,callback);
  }
  void swap() {
    return impl.swap();
  }
  void quit() {
    return impl.quit();
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
  var serializedRuntimeTypeInfo = "H4sIAAAJbogC/+xYzW7TQBD2T4HQhn+Qws+hcDIHujlWkZByICckVFQO9BRZ7pK6srPGawd4gx458ggcebQce4NdPCs2k93g0NI6VUeajnfr8c58+82snY5TyW2wR2Dx/LY2doW2YPxQ6B2hBeVFrzeIDtguzSdxRC33PwWfd3s7g+HrwV5POm7N++H1+6fwPBf8fc0/ALsJ9rNb2a9gHbS+wuEb2O9gf4L8cMyC49405HlNm78ndEMoZPEmTGktvJUf/k8H1sDwYJxlfOtCmdCRUFLynCQsChMyYmyUUHLAUkomRUKynB3SqOAkZYeM8DyqLvbDvCBhlsmVOJF/h2LESTwuaP4hjCgnVKw/5FUAW9Ip/WteOE4dvzW4lvh6sL8BzKv7plcqe9wG/1vm/T8G+94377+SLhrLvTfNK7kLuP7OrMjj8cic13XI4azxx3xUOARe/fylbFvyfwQY/Mn/RU4/liI6Mw5KzhoHXKd9S/9zXKeW1OVNYPG/IVRSdxImJbXw5cE54aTDgHHraDm4lrr9Hzx7DD1whmc8Y2NOL3l2Qp4FK8Qz3NfVA47WZp9XBzdX2xcs6tx6RZPwC93H7X0Ox/WG9HcFwI6/XN31LTio97A5HGbbfGPqrwP7oOLouqtRh5I/TxpQhyacHIjdJK1/wMldgNNNoVeFpnGSxNyM0/MG9HW9P3na2FaPXe906vEZvHOZ6lE7Di/PwxPU4csVPg+nKF9vCdy8Bbi14btr91OYmfi10ZDzb4ps3Xqzfd/dh9xl3vqR15T6atXgi7PgdxHMF38J3PwafHlbxka82hecLzLvi8CXXwEAAP//OhoFLEgUAAA=";

  // Deserialize RuntimeTypeInfo
  var bytes = BASE64.decode(serializedRuntimeTypeInfo);
  var unzippedBytes = new ZLibDecoder().convert(bytes);
  var bdata = new ByteData.view(unzippedBytes.buffer);
  var message = new bindings.Message(bdata, null, unzippedBytes.length, 0);
  _runtimeTypeInfo = mojom_types.RuntimeTypeInfo.deserialize(message);
  return _runtimeTypeInfo;
}
