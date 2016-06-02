// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library navigation_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo/mojo/url_request.mojom.dart' as url_request_mojom;

class Target extends bindings.MojoEnum {
  static const Target default_ = const Target._(0);
  static const Target sourceNode = const Target._(1);
  static const Target newNode = const Target._(2);

  const Target._(int v) : super(v);

  static const Map<String, Target> valuesMap = const {
    "default_": default_,
    "sourceNode": sourceNode,
    "newNode": newNode,
  };
  static const List<Target> values = const [
    default_,
    sourceNode,
    newNode,
  ];

  static Target valueOf(String name) => valuesMap[name];

  factory Target(int v) {
    switch (v) {
      case 0:
        return Target.default_;
      case 1:
        return Target.sourceNode;
      case 2:
        return Target.newNode;
      default:
        return null;
    }
  }

  static Target decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    Target result = new Target(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum Target.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case default_:
        return 'Target.default_';
      case sourceNode:
        return 'Target.sourceNode';
      case newNode:
        return 'Target.newNode';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}



class _NavigatorHostRequestNavigateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Target target = null;
  url_request_mojom.UrlRequest request = null;

  _NavigatorHostRequestNavigateParams() : super(kVersions.last.size);

  static _NavigatorHostRequestNavigateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _NavigatorHostRequestNavigateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _NavigatorHostRequestNavigateParams result = new _NavigatorHostRequestNavigateParams();

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
      
        result.target = Target.decode(decoder0, 8);
        if (result.target == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable Target.');
        }
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.request = url_request_mojom.UrlRequest.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeEnum(target, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "target of struct _NavigatorHostRequestNavigateParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeStruct(request, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "request of struct _NavigatorHostRequestNavigateParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_NavigatorHostRequestNavigateParams("
           "target: $target" ", "
           "request: $request" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _NavigatorHostRequestNavigateHistoryParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int delta = 0;

  _NavigatorHostRequestNavigateHistoryParams() : super(kVersions.last.size);

  static _NavigatorHostRequestNavigateHistoryParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _NavigatorHostRequestNavigateHistoryParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _NavigatorHostRequestNavigateHistoryParams result = new _NavigatorHostRequestNavigateHistoryParams();

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
      
      result.delta = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInt32(delta, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "delta of struct _NavigatorHostRequestNavigateHistoryParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_NavigatorHostRequestNavigateHistoryParams("
           "delta: $delta" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["delta"] = delta;
    return map;
  }
}


class _NavigatorHostDidNavigateLocallyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  _NavigatorHostDidNavigateLocallyParams() : super(kVersions.last.size);

  static _NavigatorHostDidNavigateLocallyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _NavigatorHostDidNavigateLocallyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _NavigatorHostDidNavigateLocallyParams result = new _NavigatorHostDidNavigateLocallyParams();

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
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(url, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "url of struct _NavigatorHostDidNavigateLocallyParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_NavigatorHostDidNavigateLocallyParams("
           "url: $url" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["url"] = url;
    return map;
  }
}

const int _navigatorHostMethodRequestNavigateName = 0;
const int _navigatorHostMethodRequestNavigateHistoryName = 1;
const int _navigatorHostMethodDidNavigateLocallyName = 2;

class _NavigatorHostServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class NavigatorHost {
  static const String serviceName = "mojo::NavigatorHost";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _NavigatorHostServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static NavigatorHostProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    NavigatorHostProxy p = new NavigatorHostProxy.unbound();
    String name = serviceName ?? NavigatorHost.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void requestNavigate(Target target, url_request_mojom.UrlRequest request);
  void requestNavigateHistory(int delta);
  void didNavigateLocally(String url);
}

abstract class NavigatorHostInterface
    implements bindings.MojoInterface<NavigatorHost>,
               NavigatorHost {
  factory NavigatorHostInterface([NavigatorHost impl]) =>
      new NavigatorHostStub.unbound(impl);

  factory NavigatorHostInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [NavigatorHost impl]) =>
      new NavigatorHostStub.fromEndpoint(endpoint, impl);

  factory NavigatorHostInterface.fromMock(
      NavigatorHost mock) =>
      new NavigatorHostProxy.fromMock(mock);
}

abstract class NavigatorHostInterfaceRequest
    implements bindings.MojoInterface<NavigatorHost>,
               NavigatorHost {
  factory NavigatorHostInterfaceRequest() =>
      new NavigatorHostProxy.unbound();
}

class _NavigatorHostProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<NavigatorHost> {
  NavigatorHost impl;

  _NavigatorHostProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _NavigatorHostProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _NavigatorHostProxyControl.unbound() : super.unbound();

  String get serviceName => NavigatorHost.serviceName;

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
    return "_NavigatorHostProxyControl($superString)";
  }
}

class NavigatorHostProxy
    extends bindings.Proxy<NavigatorHost>
    implements NavigatorHost,
               NavigatorHostInterface,
               NavigatorHostInterfaceRequest {
  NavigatorHostProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _NavigatorHostProxyControl.fromEndpoint(endpoint));

  NavigatorHostProxy.fromHandle(core.MojoHandle handle)
      : super(new _NavigatorHostProxyControl.fromHandle(handle));

  NavigatorHostProxy.unbound()
      : super(new _NavigatorHostProxyControl.unbound());

  factory NavigatorHostProxy.fromMock(NavigatorHost mock) {
    NavigatorHostProxy newMockedProxy =
        new NavigatorHostProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static NavigatorHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For NavigatorHostProxy"));
    return new NavigatorHostProxy.fromEndpoint(endpoint);
  }


  void requestNavigate(Target target, url_request_mojom.UrlRequest request) {
    if (impl != null) {
      impl.requestNavigate(target, request);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _NavigatorHostRequestNavigateParams();
    params.target = target;
    params.request = request;
    ctrl.sendMessage(params,
        _navigatorHostMethodRequestNavigateName);
  }
  void requestNavigateHistory(int delta) {
    if (impl != null) {
      impl.requestNavigateHistory(delta);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _NavigatorHostRequestNavigateHistoryParams();
    params.delta = delta;
    ctrl.sendMessage(params,
        _navigatorHostMethodRequestNavigateHistoryName);
  }
  void didNavigateLocally(String url) {
    if (impl != null) {
      impl.didNavigateLocally(url);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _NavigatorHostDidNavigateLocallyParams();
    params.url = url;
    ctrl.sendMessage(params,
        _navigatorHostMethodDidNavigateLocallyName);
  }
}

class _NavigatorHostStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<NavigatorHost> {
  NavigatorHost _impl;

  _NavigatorHostStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [NavigatorHost impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _NavigatorHostStubControl.fromHandle(
      core.MojoHandle handle, [NavigatorHost impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _NavigatorHostStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => NavigatorHost.serviceName;



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
      case _navigatorHostMethodRequestNavigateName:
        var params = _NavigatorHostRequestNavigateParams.deserialize(
            message.payload);
        _impl.requestNavigate(params.target, params.request);
        break;
      case _navigatorHostMethodRequestNavigateHistoryName:
        var params = _NavigatorHostRequestNavigateHistoryParams.deserialize(
            message.payload);
        _impl.requestNavigateHistory(params.delta);
        break;
      case _navigatorHostMethodDidNavigateLocallyName:
        var params = _NavigatorHostDidNavigateLocallyParams.deserialize(
            message.payload);
        _impl.didNavigateLocally(params.url);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  NavigatorHost get impl => _impl;
  set impl(NavigatorHost d) {
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
    return "_NavigatorHostStubControl($superString)";
  }

  int get version => 0;
}

class NavigatorHostStub
    extends bindings.Stub<NavigatorHost>
    implements NavigatorHost,
               NavigatorHostInterface,
               NavigatorHostInterfaceRequest {
  NavigatorHostStub.unbound([NavigatorHost impl])
      : super(new _NavigatorHostStubControl.unbound(impl));

  NavigatorHostStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [NavigatorHost impl])
      : super(new _NavigatorHostStubControl.fromEndpoint(endpoint, impl));

  NavigatorHostStub.fromHandle(
      core.MojoHandle handle, [NavigatorHost impl])
      : super(new _NavigatorHostStubControl.fromHandle(handle, impl));

  static NavigatorHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For NavigatorHostStub"));
    return new NavigatorHostStub.fromEndpoint(endpoint);
  }


  void requestNavigate(Target target, url_request_mojom.UrlRequest request) {
    return impl.requestNavigate(target, request);
  }
  void requestNavigateHistory(int delta) {
    return impl.requestNavigateHistory(delta);
  }
  void didNavigateLocally(String url) {
    return impl.didNavigateLocally(url);
  }
}



