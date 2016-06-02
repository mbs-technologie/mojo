// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library sharing_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



class _SharingServiceShareTextParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String text = null;

  _SharingServiceShareTextParams() : super(kVersions.last.size);

  static _SharingServiceShareTextParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SharingServiceShareTextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SharingServiceShareTextParams result = new _SharingServiceShareTextParams();

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
          "text of struct _SharingServiceShareTextParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_SharingServiceShareTextParams("
           "text: $text" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["text"] = text;
    return map;
  }
}

const int _sharingServiceMethodShareTextName = 0;

class _SharingServiceServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class SharingService {
  static const String serviceName = "mojo::SharingService";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _SharingServiceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static SharingServiceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    SharingServiceProxy p = new SharingServiceProxy.unbound();
    String name = serviceName ?? SharingService.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void shareText(String text);
}

abstract class SharingServiceInterface
    implements bindings.MojoInterface<SharingService>,
               SharingService {
  factory SharingServiceInterface([SharingService impl]) =>
      new SharingServiceStub.unbound(impl);

  factory SharingServiceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [SharingService impl]) =>
      new SharingServiceStub.fromEndpoint(endpoint, impl);

  factory SharingServiceInterface.fromMock(
      SharingService mock) =>
      new SharingServiceProxy.fromMock(mock);
}

abstract class SharingServiceInterfaceRequest
    implements bindings.MojoInterface<SharingService>,
               SharingService {
  factory SharingServiceInterfaceRequest() =>
      new SharingServiceProxy.unbound();
}

class _SharingServiceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<SharingService> {
  SharingService impl;

  _SharingServiceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _SharingServiceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _SharingServiceProxyControl.unbound() : super.unbound();

  String get serviceName => SharingService.serviceName;

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
    return "_SharingServiceProxyControl($superString)";
  }
}

class SharingServiceProxy
    extends bindings.Proxy<SharingService>
    implements SharingService,
               SharingServiceInterface,
               SharingServiceInterfaceRequest {
  SharingServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _SharingServiceProxyControl.fromEndpoint(endpoint));

  SharingServiceProxy.fromHandle(core.MojoHandle handle)
      : super(new _SharingServiceProxyControl.fromHandle(handle));

  SharingServiceProxy.unbound()
      : super(new _SharingServiceProxyControl.unbound());

  factory SharingServiceProxy.fromMock(SharingService mock) {
    SharingServiceProxy newMockedProxy =
        new SharingServiceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static SharingServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SharingServiceProxy"));
    return new SharingServiceProxy.fromEndpoint(endpoint);
  }


  void shareText(String text) {
    if (impl != null) {
      impl.shareText(text);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _SharingServiceShareTextParams();
    params.text = text;
    ctrl.sendMessage(params,
        _sharingServiceMethodShareTextName);
  }
}

class _SharingServiceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<SharingService> {
  SharingService _impl;

  _SharingServiceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [SharingService impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _SharingServiceStubControl.fromHandle(
      core.MojoHandle handle, [SharingService impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _SharingServiceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => SharingService.serviceName;



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
      case _sharingServiceMethodShareTextName:
        var params = _SharingServiceShareTextParams.deserialize(
            message.payload);
        _impl.shareText(params.text);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  SharingService get impl => _impl;
  set impl(SharingService d) {
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
    return "_SharingServiceStubControl($superString)";
  }

  int get version => 0;
}

class SharingServiceStub
    extends bindings.Stub<SharingService>
    implements SharingService,
               SharingServiceInterface,
               SharingServiceInterfaceRequest {
  SharingServiceStub.unbound([SharingService impl])
      : super(new _SharingServiceStubControl.unbound(impl));

  SharingServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [SharingService impl])
      : super(new _SharingServiceStubControl.fromEndpoint(endpoint, impl));

  SharingServiceStub.fromHandle(
      core.MojoHandle handle, [SharingService impl])
      : super(new _SharingServiceStubControl.fromHandle(handle, impl));

  static SharingServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SharingServiceStub"));
    return new SharingServiceStub.fromEndpoint(endpoint);
  }


  void shareText(String text) {
    return impl.shareText(text);
  }
}



