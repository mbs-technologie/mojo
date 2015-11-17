// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library view_provider_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo_services/mojo/ui/views.mojom.dart' as views_mojom;



class ViewProviderCreateViewParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Object services = null;
  Object exposedServices = null;

  ViewProviderCreateViewParams() : super(kVersions.last.size);

  static ViewProviderCreateViewParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ViewProviderCreateViewParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewProviderCreateViewParams result = new ViewProviderCreateViewParams();

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
      
      result.services = decoder0.decodeInterfaceRequest(8, true, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.exposedServices = decoder0.decodeServiceInterface(12, true, service_provider_mojom.ServiceProviderProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterfaceRequest(services, 8, true);
    
    encoder0.encodeInterface(exposedServices, 12, true);
  }

  String toString() {
    return "ViewProviderCreateViewParams("
           "services: $services" ", "
           "exposedServices: $exposedServices" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class ViewProviderCreateViewResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  views_mojom.ViewToken viewToken = null;

  ViewProviderCreateViewResponseParams() : super(kVersions.last.size);

  static ViewProviderCreateViewResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ViewProviderCreateViewResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewProviderCreateViewResponseParams result = new ViewProviderCreateViewResponseParams();

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
      result.viewToken = views_mojom.ViewToken.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(viewToken, 8, false);
  }

  String toString() {
    return "ViewProviderCreateViewResponseParams("
           "viewToken: $viewToken" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["viewToken"] = viewToken;
    return map;
  }
}

const int kViewProvider_createView_name = 0;

const String ViewProviderName =
      'mojo::ui::ViewProvider';

abstract class ViewProvider {
  dynamic createView(Object services,Object exposedServices,[Function responseFactory = null]);

}


class ViewProviderProxyImpl extends bindings.Proxy {
  ViewProviderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ViewProviderProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewProviderProxyImpl.unbound() : super.unbound();

  static ViewProviderProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewProviderProxyImpl"));
    return new ViewProviderProxyImpl.fromEndpoint(endpoint);
  }

  String get name => ViewProviderName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kViewProvider_createView_name:
        var r = ViewProviderCreateViewResponseParams.deserialize(
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

  String toString() {
    var superString = super.toString();
    return "ViewProviderProxyImpl($superString)";
  }
}


class _ViewProviderProxyCalls implements ViewProvider {
  ViewProviderProxyImpl _proxyImpl;

  _ViewProviderProxyCalls(this._proxyImpl);
    dynamic createView(Object services,Object exposedServices,[Function responseFactory = null]) {
      var params = new ViewProviderCreateViewParams();
      params.services = services;
      params.exposedServices = exposedServices;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kViewProvider_createView_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class ViewProviderProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ViewProvider ptr;
  final String name = ViewProviderName;

  ViewProviderProxy(ViewProviderProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ViewProviderProxyCalls(proxyImpl);

  ViewProviderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ViewProviderProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ViewProviderProxyCalls(impl);
  }

  ViewProviderProxy.fromHandle(core.MojoHandle handle) :
      impl = new ViewProviderProxyImpl.fromHandle(handle) {
    ptr = new _ViewProviderProxyCalls(impl);
  }

  ViewProviderProxy.unbound() :
      impl = new ViewProviderProxyImpl.unbound() {
    ptr = new _ViewProviderProxyCalls(impl);
  }

  factory ViewProviderProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    ViewProviderProxy p = new ViewProviderProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static ViewProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewProviderProxy"));
    return new ViewProviderProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "ViewProviderProxy($impl)";
  }
}


class ViewProviderStub extends bindings.Stub {
  ViewProvider _impl = null;

  ViewProviderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ViewProviderStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ViewProviderStub.unbound() : super.unbound();

  static ViewProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewProviderStub"));
    return new ViewProviderStub.fromEndpoint(endpoint);
  }

  static const String name = ViewProviderName;


  ViewProviderCreateViewResponseParams _ViewProviderCreateViewResponseParamsFactory(views_mojom.ViewToken viewToken) {
    var result = new ViewProviderCreateViewResponseParams();
    result.viewToken = viewToken;
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kViewProvider_createView_name:
        var params = ViewProviderCreateViewParams.deserialize(
            message.payload);
        var response = _impl.createView(params.services,params.exposedServices,_ViewProviderCreateViewResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kViewProvider_createView_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kViewProvider_createView_name,
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

  ViewProvider get impl => _impl;
  set impl(ViewProvider d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ViewProviderStub($superString)";
  }

  int get version => 0;
}


