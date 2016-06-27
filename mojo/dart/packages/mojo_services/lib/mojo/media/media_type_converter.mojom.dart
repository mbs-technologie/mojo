// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library media_type_converter_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/mojo/media/media_transport.mojom.dart' as media_transport_mojom;
import 'package:mojo_services/mojo/media/media_types.mojom.dart' as media_types_mojom;



class _MediaTypeConverterGetOutputTypeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _MediaTypeConverterGetOutputTypeParams() : super(kVersions.last.size);

  _MediaTypeConverterGetOutputTypeParams.init(
  ) : super(kVersions.last.size);

  static _MediaTypeConverterGetOutputTypeParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTypeConverterGetOutputTypeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTypeConverterGetOutputTypeParams result = new _MediaTypeConverterGetOutputTypeParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTypeConverterGetOutputTypeParams";
    String fieldName;
    try {
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTypeConverterGetOutputTypeParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class MediaTypeConverterGetOutputTypeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  media_types_mojom.MediaType outputType = null;

  MediaTypeConverterGetOutputTypeResponseParams() : super(kVersions.last.size);

  MediaTypeConverterGetOutputTypeResponseParams.init(
    media_types_mojom.MediaType this.outputType
  ) : super(kVersions.last.size);

  static MediaTypeConverterGetOutputTypeResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static MediaTypeConverterGetOutputTypeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    MediaTypeConverterGetOutputTypeResponseParams result = new MediaTypeConverterGetOutputTypeResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.outputType = media_types_mojom.MediaType.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "MediaTypeConverterGetOutputTypeResponseParams";
    String fieldName;
    try {
      fieldName = "outputType";
      encoder0.encodeStruct(outputType, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "MediaTypeConverterGetOutputTypeResponseParams("
           "outputType: $outputType" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["outputType"] = outputType;
    return map;
  }
}


class _MediaTypeConverterGetPacketConsumerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  media_transport_mojom.MediaPacketConsumerInterfaceRequest packetConsumer = null;

  _MediaTypeConverterGetPacketConsumerParams() : super(kVersions.last.size);

  _MediaTypeConverterGetPacketConsumerParams.init(
    media_transport_mojom.MediaPacketConsumerInterfaceRequest this.packetConsumer
  ) : super(kVersions.last.size);

  static _MediaTypeConverterGetPacketConsumerParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTypeConverterGetPacketConsumerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTypeConverterGetPacketConsumerParams result = new _MediaTypeConverterGetPacketConsumerParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.packetConsumer = decoder0.decodeInterfaceRequest(8, false, media_transport_mojom.MediaPacketConsumerStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTypeConverterGetPacketConsumerParams";
    String fieldName;
    try {
      fieldName = "packetConsumer";
      encoder0.encodeInterfaceRequest(packetConsumer, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTypeConverterGetPacketConsumerParams("
           "packetConsumer: $packetConsumer" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _MediaTypeConverterGetPacketProducerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  media_transport_mojom.MediaPacketProducerInterfaceRequest packetProducer = null;

  _MediaTypeConverterGetPacketProducerParams() : super(kVersions.last.size);

  _MediaTypeConverterGetPacketProducerParams.init(
    media_transport_mojom.MediaPacketProducerInterfaceRequest this.packetProducer
  ) : super(kVersions.last.size);

  static _MediaTypeConverterGetPacketProducerParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTypeConverterGetPacketProducerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTypeConverterGetPacketProducerParams result = new _MediaTypeConverterGetPacketProducerParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.packetProducer = decoder0.decodeInterfaceRequest(8, false, media_transport_mojom.MediaPacketProducerStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTypeConverterGetPacketProducerParams";
    String fieldName;
    try {
      fieldName = "packetProducer";
      encoder0.encodeInterfaceRequest(packetProducer, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTypeConverterGetPacketProducerParams("
           "packetProducer: $packetProducer" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _mediaTypeConverterMethodGetOutputTypeName = 0;
const int _mediaTypeConverterMethodGetPacketConsumerName = 1;
const int _mediaTypeConverterMethodGetPacketProducerName = 2;

class _MediaTypeConverterServiceDescription implements service_describer.ServiceDescription {
  void getTopLevelInterface(Function responder) {
    responder(null);
  }

  void getTypeDefinition(String typeKey, Function responder) {
    responder(null);
  }

  void getAllTypeDefinitions(Function responder) {
    responder(null);
  }
}

abstract class MediaTypeConverter {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _MediaTypeConverterServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static MediaTypeConverterProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    MediaTypeConverterProxy p = new MediaTypeConverterProxy.unbound();
    String name = serviceName ?? MediaTypeConverter.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void getOutputType(void callback(media_types_mojom.MediaType outputType));
  void getPacketConsumer(media_transport_mojom.MediaPacketConsumerInterfaceRequest packetConsumer);
  void getPacketProducer(media_transport_mojom.MediaPacketProducerInterfaceRequest packetProducer);
}

abstract class MediaTypeConverterInterface
    implements bindings.MojoInterface<MediaTypeConverter>,
               MediaTypeConverter {
  factory MediaTypeConverterInterface([MediaTypeConverter impl]) =>
      new MediaTypeConverterStub.unbound(impl);

  factory MediaTypeConverterInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [MediaTypeConverter impl]) =>
      new MediaTypeConverterStub.fromEndpoint(endpoint, impl);

  factory MediaTypeConverterInterface.fromMock(
      MediaTypeConverter mock) =>
      new MediaTypeConverterProxy.fromMock(mock);
}

abstract class MediaTypeConverterInterfaceRequest
    implements bindings.MojoInterface<MediaTypeConverter>,
               MediaTypeConverter {
  factory MediaTypeConverterInterfaceRequest() =>
      new MediaTypeConverterProxy.unbound();
}

class _MediaTypeConverterProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<MediaTypeConverter> {
  MediaTypeConverter impl;

  _MediaTypeConverterProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _MediaTypeConverterProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _MediaTypeConverterProxyControl.unbound() : super.unbound();

  String get serviceName => MediaTypeConverter.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _mediaTypeConverterMethodGetOutputTypeName:
        Function callback = getCallback(message);
        if (callback != null) {
          var r = MediaTypeConverterGetOutputTypeResponseParams.deserialize(
              message.payload);
          callback(r.outputType );
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
    return "_MediaTypeConverterProxyControl($superString)";
  }
}

class MediaTypeConverterProxy
    extends bindings.Proxy<MediaTypeConverter>
    implements MediaTypeConverter,
               MediaTypeConverterInterface,
               MediaTypeConverterInterfaceRequest {
  MediaTypeConverterProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _MediaTypeConverterProxyControl.fromEndpoint(endpoint));

  MediaTypeConverterProxy.fromHandle(core.MojoHandle handle)
      : super(new _MediaTypeConverterProxyControl.fromHandle(handle));

  MediaTypeConverterProxy.unbound()
      : super(new _MediaTypeConverterProxyControl.unbound());

  factory MediaTypeConverterProxy.fromMock(MediaTypeConverter mock) {
    MediaTypeConverterProxy newMockedProxy =
        new MediaTypeConverterProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static MediaTypeConverterProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For MediaTypeConverterProxy"));
    return new MediaTypeConverterProxy.fromEndpoint(endpoint);
  }


  void getOutputType(void callback(media_types_mojom.MediaType outputType)) {
    if (impl != null) {
      impl.getOutputType(callback ?? bindings.DoNothingFunction.fn);
      return;
    }
    var params = new _MediaTypeConverterGetOutputTypeParams();
    Function zonedCallback;
    if ((callback == null) || identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((media_types_mojom.MediaType outputType) {
        z.bindCallback(() {
          callback(outputType);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _mediaTypeConverterMethodGetOutputTypeName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void getPacketConsumer(media_transport_mojom.MediaPacketConsumerInterfaceRequest packetConsumer) {
    if (impl != null) {
      impl.getPacketConsumer(packetConsumer);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _MediaTypeConverterGetPacketConsumerParams();
    params.packetConsumer = packetConsumer;
    ctrl.sendMessage(params,
        _mediaTypeConverterMethodGetPacketConsumerName);
  }
  void getPacketProducer(media_transport_mojom.MediaPacketProducerInterfaceRequest packetProducer) {
    if (impl != null) {
      impl.getPacketProducer(packetProducer);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _MediaTypeConverterGetPacketProducerParams();
    params.packetProducer = packetProducer;
    ctrl.sendMessage(params,
        _mediaTypeConverterMethodGetPacketProducerName);
  }
}

class _MediaTypeConverterStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<MediaTypeConverter> {
  MediaTypeConverter _impl;

  _MediaTypeConverterStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [MediaTypeConverter impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _MediaTypeConverterStubControl.fromHandle(
      core.MojoHandle handle, [MediaTypeConverter impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _MediaTypeConverterStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => MediaTypeConverter.serviceName;


  Function _mediaTypeConverterGetOutputTypeResponseParamsResponder(
      int requestId) {
  return (media_types_mojom.MediaType outputType) {
      var result = new MediaTypeConverterGetOutputTypeResponseParams();
      result.outputType = outputType;
      sendResponse(buildResponseWithId(
          result,
          _mediaTypeConverterMethodGetOutputTypeName,
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
      case _mediaTypeConverterMethodGetOutputTypeName:
        _impl.getOutputType(_mediaTypeConverterGetOutputTypeResponseParamsResponder(message.header.requestId));
        break;
      case _mediaTypeConverterMethodGetPacketConsumerName:
        var params = _MediaTypeConverterGetPacketConsumerParams.deserialize(
            message.payload);
        _impl.getPacketConsumer(params.packetConsumer);
        break;
      case _mediaTypeConverterMethodGetPacketProducerName:
        var params = _MediaTypeConverterGetPacketProducerParams.deserialize(
            message.payload);
        _impl.getPacketProducer(params.packetProducer);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  MediaTypeConverter get impl => _impl;
  set impl(MediaTypeConverter d) {
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
    return "_MediaTypeConverterStubControl($superString)";
  }

  int get version => 0;
}

class MediaTypeConverterStub
    extends bindings.Stub<MediaTypeConverter>
    implements MediaTypeConverter,
               MediaTypeConverterInterface,
               MediaTypeConverterInterfaceRequest {
  MediaTypeConverterStub.unbound([MediaTypeConverter impl])
      : super(new _MediaTypeConverterStubControl.unbound(impl));

  MediaTypeConverterStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [MediaTypeConverter impl])
      : super(new _MediaTypeConverterStubControl.fromEndpoint(endpoint, impl));

  MediaTypeConverterStub.fromHandle(
      core.MojoHandle handle, [MediaTypeConverter impl])
      : super(new _MediaTypeConverterStubControl.fromHandle(handle, impl));

  static MediaTypeConverterStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For MediaTypeConverterStub"));
    return new MediaTypeConverterStub.fromEndpoint(endpoint);
  }


  void getOutputType(void callback(media_types_mojom.MediaType outputType)) {
    return impl.getOutputType(callback);
  }
  void getPacketConsumer(media_transport_mojom.MediaPacketConsumerInterfaceRequest packetConsumer) {
    return impl.getPacketConsumer(packetConsumer);
  }
  void getPacketProducer(media_transport_mojom.MediaPacketProducerInterfaceRequest packetProducer) {
    return impl.getPacketProducer(packetProducer);
  }
}



