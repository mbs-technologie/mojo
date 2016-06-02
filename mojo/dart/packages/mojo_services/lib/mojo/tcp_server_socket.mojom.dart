// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_server_socket_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo/mojo/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo_services/mojo/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo_services/mojo/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;



class _TcpServerSocketAcceptParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  tcp_connected_socket_mojom.TcpConnectedSocketInterfaceRequest clientSocket = null;

  _TcpServerSocketAcceptParams() : super(kVersions.last.size);

  static _TcpServerSocketAcceptParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _TcpServerSocketAcceptParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _TcpServerSocketAcceptParams result = new _TcpServerSocketAcceptParams();

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
      
      result.sendStream = decoder0.decodeConsumerHandle(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.receiveStream = decoder0.decodeProducerHandle(12, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(16, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeConsumerHandle(sendStream, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "sendStream of struct _TcpServerSocketAcceptParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeProducerHandle(receiveStream, 12, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "receiveStream of struct _TcpServerSocketAcceptParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInterfaceRequest(clientSocket, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "clientSocket of struct _TcpServerSocketAcceptParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_TcpServerSocketAcceptParams("
           "sendStream: $sendStream" ", "
           "receiveStream: $receiveStream" ", "
           "clientSocket: $clientSocket" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class TcpServerSocketAcceptResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress remoteAddress = null;

  TcpServerSocketAcceptResponseParams() : super(kVersions.last.size);

  static TcpServerSocketAcceptResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static TcpServerSocketAcceptResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptResponseParams result = new TcpServerSocketAcceptResponseParams();

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
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(result, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "result of struct TcpServerSocketAcceptResponseParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeStruct(remoteAddress, 16, true);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "remoteAddress of struct TcpServerSocketAcceptResponseParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "TcpServerSocketAcceptResponseParams("
           "result: $result" ", "
           "remoteAddress: $remoteAddress" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["result"] = result;
    map["remoteAddress"] = remoteAddress;
    return map;
  }
}

const int _tcpServerSocketMethodAcceptName = 0;

class _TcpServerSocketServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class TcpServerSocket {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _TcpServerSocketServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static TcpServerSocketProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    TcpServerSocketProxy p = new TcpServerSocketProxy.unbound();
    String name = serviceName ?? TcpServerSocket.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  dynamic accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,tcp_connected_socket_mojom.TcpConnectedSocketInterfaceRequest clientSocket,[Function responseFactory = null]);
}

abstract class TcpServerSocketInterface
    implements bindings.MojoInterface<TcpServerSocket>,
               TcpServerSocket {
  factory TcpServerSocketInterface([TcpServerSocket impl]) =>
      new TcpServerSocketStub.unbound(impl);

  factory TcpServerSocketInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [TcpServerSocket impl]) =>
      new TcpServerSocketStub.fromEndpoint(endpoint, impl);

  factory TcpServerSocketInterface.fromMock(
      TcpServerSocket mock) =>
      new TcpServerSocketProxy.fromMock(mock);
}

abstract class TcpServerSocketInterfaceRequest
    implements bindings.MojoInterface<TcpServerSocket>,
               TcpServerSocket {
  factory TcpServerSocketInterfaceRequest() =>
      new TcpServerSocketProxy.unbound();
}

class _TcpServerSocketProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<TcpServerSocket> {
  TcpServerSocket impl;

  _TcpServerSocketProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _TcpServerSocketProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _TcpServerSocketProxyControl.unbound() : super.unbound();

  String get serviceName => TcpServerSocket.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _tcpServerSocketMethodAcceptName:
        var r = TcpServerSocketAcceptResponseParams.deserialize(
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
    return "_TcpServerSocketProxyControl($superString)";
  }
}

class TcpServerSocketProxy
    extends bindings.Proxy<TcpServerSocket>
    implements TcpServerSocket,
               TcpServerSocketInterface,
               TcpServerSocketInterfaceRequest {
  TcpServerSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _TcpServerSocketProxyControl.fromEndpoint(endpoint));

  TcpServerSocketProxy.fromHandle(core.MojoHandle handle)
      : super(new _TcpServerSocketProxyControl.fromHandle(handle));

  TcpServerSocketProxy.unbound()
      : super(new _TcpServerSocketProxyControl.unbound());

  factory TcpServerSocketProxy.fromMock(TcpServerSocket mock) {
    TcpServerSocketProxy newMockedProxy =
        new TcpServerSocketProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static TcpServerSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpServerSocketProxy"));
    return new TcpServerSocketProxy.fromEndpoint(endpoint);
  }


  dynamic accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,tcp_connected_socket_mojom.TcpConnectedSocketInterfaceRequest clientSocket,[Function responseFactory = null]) {
    if (impl != null) {
      return new Future(() => impl.accept(sendStream,receiveStream,clientSocket,_TcpServerSocketStubControl._tcpServerSocketAcceptResponseParamsFactory));
    }
    var params = new _TcpServerSocketAcceptParams();
    params.sendStream = sendStream;
    params.receiveStream = receiveStream;
    params.clientSocket = clientSocket;
    return ctrl.sendMessageWithRequestId(
        params,
        _tcpServerSocketMethodAcceptName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class _TcpServerSocketStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<TcpServerSocket> {
  TcpServerSocket _impl;

  _TcpServerSocketStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [TcpServerSocket impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _TcpServerSocketStubControl.fromHandle(
      core.MojoHandle handle, [TcpServerSocket impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _TcpServerSocketStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => TcpServerSocket.serviceName;


  static TcpServerSocketAcceptResponseParams _tcpServerSocketAcceptResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress remoteAddress) {
    var result = new TcpServerSocketAcceptResponseParams();
    result.result = result;
    result.remoteAddress = remoteAddress;
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
      case _tcpServerSocketMethodAcceptName:
        var params = _TcpServerSocketAcceptParams.deserialize(
            message.payload);
        var response = _impl.accept(params.sendStream,params.receiveStream,params.clientSocket,_tcpServerSocketAcceptResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _tcpServerSocketMethodAcceptName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _tcpServerSocketMethodAcceptName,
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

  TcpServerSocket get impl => _impl;
  set impl(TcpServerSocket d) {
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
    return "_TcpServerSocketStubControl($superString)";
  }

  int get version => 0;
}

class TcpServerSocketStub
    extends bindings.Stub<TcpServerSocket>
    implements TcpServerSocket,
               TcpServerSocketInterface,
               TcpServerSocketInterfaceRequest {
  TcpServerSocketStub.unbound([TcpServerSocket impl])
      : super(new _TcpServerSocketStubControl.unbound(impl));

  TcpServerSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [TcpServerSocket impl])
      : super(new _TcpServerSocketStubControl.fromEndpoint(endpoint, impl));

  TcpServerSocketStub.fromHandle(
      core.MojoHandle handle, [TcpServerSocket impl])
      : super(new _TcpServerSocketStubControl.fromHandle(handle, impl));

  static TcpServerSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpServerSocketStub"));
    return new TcpServerSocketStub.fromEndpoint(endpoint);
  }


  dynamic accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,tcp_connected_socket_mojom.TcpConnectedSocketInterfaceRequest clientSocket,[Function responseFactory = null]) {
    return impl.accept(sendStream,receiveStream,clientSocket,responseFactory);
  }
}



