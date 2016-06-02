// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_connected_socket_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



class _TcpConnectedSocketServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class TcpConnectedSocket {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _TcpConnectedSocketServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static TcpConnectedSocketProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    TcpConnectedSocketProxy p = new TcpConnectedSocketProxy.unbound();
    String name = serviceName ?? TcpConnectedSocket.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
}

abstract class TcpConnectedSocketInterface
    implements bindings.MojoInterface<TcpConnectedSocket>,
               TcpConnectedSocket {
  factory TcpConnectedSocketInterface([TcpConnectedSocket impl]) =>
      new TcpConnectedSocketStub.unbound(impl);

  factory TcpConnectedSocketInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [TcpConnectedSocket impl]) =>
      new TcpConnectedSocketStub.fromEndpoint(endpoint, impl);

  factory TcpConnectedSocketInterface.fromMock(
      TcpConnectedSocket mock) =>
      new TcpConnectedSocketProxy.fromMock(mock);
}

abstract class TcpConnectedSocketInterfaceRequest
    implements bindings.MojoInterface<TcpConnectedSocket>,
               TcpConnectedSocket {
  factory TcpConnectedSocketInterfaceRequest() =>
      new TcpConnectedSocketProxy.unbound();
}

class _TcpConnectedSocketProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<TcpConnectedSocket> {
  TcpConnectedSocket impl;

  _TcpConnectedSocketProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _TcpConnectedSocketProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _TcpConnectedSocketProxyControl.unbound() : super.unbound();

  String get serviceName => TcpConnectedSocket.serviceName;

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
    return "_TcpConnectedSocketProxyControl($superString)";
  }
}

class TcpConnectedSocketProxy
    extends bindings.Proxy<TcpConnectedSocket>
    implements TcpConnectedSocket,
               TcpConnectedSocketInterface,
               TcpConnectedSocketInterfaceRequest {
  TcpConnectedSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _TcpConnectedSocketProxyControl.fromEndpoint(endpoint));

  TcpConnectedSocketProxy.fromHandle(core.MojoHandle handle)
      : super(new _TcpConnectedSocketProxyControl.fromHandle(handle));

  TcpConnectedSocketProxy.unbound()
      : super(new _TcpConnectedSocketProxyControl.unbound());

  factory TcpConnectedSocketProxy.fromMock(TcpConnectedSocket mock) {
    TcpConnectedSocketProxy newMockedProxy =
        new TcpConnectedSocketProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static TcpConnectedSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpConnectedSocketProxy"));
    return new TcpConnectedSocketProxy.fromEndpoint(endpoint);
  }


}

class _TcpConnectedSocketStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<TcpConnectedSocket> {
  TcpConnectedSocket _impl;

  _TcpConnectedSocketStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [TcpConnectedSocket impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _TcpConnectedSocketStubControl.fromHandle(
      core.MojoHandle handle, [TcpConnectedSocket impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _TcpConnectedSocketStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => TcpConnectedSocket.serviceName;



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
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TcpConnectedSocket get impl => _impl;
  set impl(TcpConnectedSocket d) {
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
    return "_TcpConnectedSocketStubControl($superString)";
  }

  int get version => 0;
}

class TcpConnectedSocketStub
    extends bindings.Stub<TcpConnectedSocket>
    implements TcpConnectedSocket,
               TcpConnectedSocketInterface,
               TcpConnectedSocketInterfaceRequest {
  TcpConnectedSocketStub.unbound([TcpConnectedSocket impl])
      : super(new _TcpConnectedSocketStubControl.unbound(impl));

  TcpConnectedSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [TcpConnectedSocket impl])
      : super(new _TcpConnectedSocketStubControl.fromEndpoint(endpoint, impl));

  TcpConnectedSocketStub.fromHandle(
      core.MojoHandle handle, [TcpConnectedSocket impl])
      : super(new _TcpConnectedSocketStubControl.fromHandle(handle, impl));

  static TcpConnectedSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpConnectedSocketStub"));
    return new TcpConnectedSocketStub.fromEndpoint(endpoint);
  }


}



