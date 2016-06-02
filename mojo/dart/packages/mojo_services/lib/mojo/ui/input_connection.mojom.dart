// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library input_connection_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/mojo/input_events.mojom.dart' as input_events_mojom;



class _InputConnectionSetListenerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  InputListenerInterface listener = null;

  _InputConnectionSetListenerParams() : super(kVersions.last.size);

  static _InputConnectionSetListenerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _InputConnectionSetListenerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _InputConnectionSetListenerParams result = new _InputConnectionSetListenerParams();

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
      
      result.listener = decoder0.decodeServiceInterface(8, true, InputListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterface(listener, 8, true);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "listener of struct _InputConnectionSetListenerParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_InputConnectionSetListenerParams("
           "listener: $listener" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _InputListenerOnEventParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  input_events_mojom.Event event = null;

  _InputListenerOnEventParams() : super(kVersions.last.size);

  static _InputListenerOnEventParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _InputListenerOnEventParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _InputListenerOnEventParams result = new _InputListenerOnEventParams();

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
      result.event = input_events_mojom.Event.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(event, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "event of struct _InputListenerOnEventParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_InputListenerOnEventParams("
           "event: $event" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["event"] = event;
    return map;
  }
}


class InputListenerOnEventResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool consumed = false;

  InputListenerOnEventResponseParams() : super(kVersions.last.size);

  static InputListenerOnEventResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static InputListenerOnEventResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InputListenerOnEventResponseParams result = new InputListenerOnEventResponseParams();

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
      
      result.consumed = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeBool(consumed, 8, 0);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "consumed of struct InputListenerOnEventResponseParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "InputListenerOnEventResponseParams("
           "consumed: $consumed" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["consumed"] = consumed;
    return map;
  }
}

const int _inputConnectionMethodSetListenerName = 0;

class _InputConnectionServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class InputConnection {
  static const String serviceName = "mojo::ui::InputConnection";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _InputConnectionServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static InputConnectionProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    InputConnectionProxy p = new InputConnectionProxy.unbound();
    String name = serviceName ?? InputConnection.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void setListener(InputListenerInterface listener);
}

abstract class InputConnectionInterface
    implements bindings.MojoInterface<InputConnection>,
               InputConnection {
  factory InputConnectionInterface([InputConnection impl]) =>
      new InputConnectionStub.unbound(impl);

  factory InputConnectionInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [InputConnection impl]) =>
      new InputConnectionStub.fromEndpoint(endpoint, impl);

  factory InputConnectionInterface.fromMock(
      InputConnection mock) =>
      new InputConnectionProxy.fromMock(mock);
}

abstract class InputConnectionInterfaceRequest
    implements bindings.MojoInterface<InputConnection>,
               InputConnection {
  factory InputConnectionInterfaceRequest() =>
      new InputConnectionProxy.unbound();
}

class _InputConnectionProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<InputConnection> {
  InputConnection impl;

  _InputConnectionProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _InputConnectionProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _InputConnectionProxyControl.unbound() : super.unbound();

  String get serviceName => InputConnection.serviceName;

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
    return "_InputConnectionProxyControl($superString)";
  }
}

class InputConnectionProxy
    extends bindings.Proxy<InputConnection>
    implements InputConnection,
               InputConnectionInterface,
               InputConnectionInterfaceRequest {
  InputConnectionProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _InputConnectionProxyControl.fromEndpoint(endpoint));

  InputConnectionProxy.fromHandle(core.MojoHandle handle)
      : super(new _InputConnectionProxyControl.fromHandle(handle));

  InputConnectionProxy.unbound()
      : super(new _InputConnectionProxyControl.unbound());

  factory InputConnectionProxy.fromMock(InputConnection mock) {
    InputConnectionProxy newMockedProxy =
        new InputConnectionProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static InputConnectionProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For InputConnectionProxy"));
    return new InputConnectionProxy.fromEndpoint(endpoint);
  }


  void setListener(InputListenerInterface listener) {
    if (impl != null) {
      impl.setListener(listener);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _InputConnectionSetListenerParams();
    params.listener = listener;
    ctrl.sendMessage(params,
        _inputConnectionMethodSetListenerName);
  }
}

class _InputConnectionStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<InputConnection> {
  InputConnection _impl;

  _InputConnectionStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [InputConnection impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _InputConnectionStubControl.fromHandle(
      core.MojoHandle handle, [InputConnection impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _InputConnectionStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => InputConnection.serviceName;



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
      case _inputConnectionMethodSetListenerName:
        var params = _InputConnectionSetListenerParams.deserialize(
            message.payload);
        _impl.setListener(params.listener);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InputConnection get impl => _impl;
  set impl(InputConnection d) {
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
    return "_InputConnectionStubControl($superString)";
  }

  int get version => 0;
}

class InputConnectionStub
    extends bindings.Stub<InputConnection>
    implements InputConnection,
               InputConnectionInterface,
               InputConnectionInterfaceRequest {
  InputConnectionStub.unbound([InputConnection impl])
      : super(new _InputConnectionStubControl.unbound(impl));

  InputConnectionStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [InputConnection impl])
      : super(new _InputConnectionStubControl.fromEndpoint(endpoint, impl));

  InputConnectionStub.fromHandle(
      core.MojoHandle handle, [InputConnection impl])
      : super(new _InputConnectionStubControl.fromHandle(handle, impl));

  static InputConnectionStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For InputConnectionStub"));
    return new InputConnectionStub.fromEndpoint(endpoint);
  }


  void setListener(InputListenerInterface listener) {
    return impl.setListener(listener);
  }
}

const int _inputListenerMethodOnEventName = 0;

class _InputListenerServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class InputListener {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _InputListenerServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static InputListenerProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    InputListenerProxy p = new InputListenerProxy.unbound();
    String name = serviceName ?? InputListener.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  dynamic onEvent(input_events_mojom.Event event,[Function responseFactory = null]);
}

abstract class InputListenerInterface
    implements bindings.MojoInterface<InputListener>,
               InputListener {
  factory InputListenerInterface([InputListener impl]) =>
      new InputListenerStub.unbound(impl);

  factory InputListenerInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [InputListener impl]) =>
      new InputListenerStub.fromEndpoint(endpoint, impl);

  factory InputListenerInterface.fromMock(
      InputListener mock) =>
      new InputListenerProxy.fromMock(mock);
}

abstract class InputListenerInterfaceRequest
    implements bindings.MojoInterface<InputListener>,
               InputListener {
  factory InputListenerInterfaceRequest() =>
      new InputListenerProxy.unbound();
}

class _InputListenerProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<InputListener> {
  InputListener impl;

  _InputListenerProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _InputListenerProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _InputListenerProxyControl.unbound() : super.unbound();

  String get serviceName => InputListener.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _inputListenerMethodOnEventName:
        var r = InputListenerOnEventResponseParams.deserialize(
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
    return "_InputListenerProxyControl($superString)";
  }
}

class InputListenerProxy
    extends bindings.Proxy<InputListener>
    implements InputListener,
               InputListenerInterface,
               InputListenerInterfaceRequest {
  InputListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _InputListenerProxyControl.fromEndpoint(endpoint));

  InputListenerProxy.fromHandle(core.MojoHandle handle)
      : super(new _InputListenerProxyControl.fromHandle(handle));

  InputListenerProxy.unbound()
      : super(new _InputListenerProxyControl.unbound());

  factory InputListenerProxy.fromMock(InputListener mock) {
    InputListenerProxy newMockedProxy =
        new InputListenerProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static InputListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For InputListenerProxy"));
    return new InputListenerProxy.fromEndpoint(endpoint);
  }


  dynamic onEvent(input_events_mojom.Event event,[Function responseFactory = null]) {
    if (impl != null) {
      return new Future(() => impl.onEvent(event,_InputListenerStubControl._inputListenerOnEventResponseParamsFactory));
    }
    var params = new _InputListenerOnEventParams();
    params.event = event;
    return ctrl.sendMessageWithRequestId(
        params,
        _inputListenerMethodOnEventName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class _InputListenerStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<InputListener> {
  InputListener _impl;

  _InputListenerStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [InputListener impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _InputListenerStubControl.fromHandle(
      core.MojoHandle handle, [InputListener impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _InputListenerStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => InputListener.serviceName;


  static InputListenerOnEventResponseParams _inputListenerOnEventResponseParamsFactory(bool consumed) {
    var result = new InputListenerOnEventResponseParams();
    result.consumed = consumed;
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
      case _inputListenerMethodOnEventName:
        var params = _InputListenerOnEventParams.deserialize(
            message.payload);
        var response = _impl.onEvent(params.event,_inputListenerOnEventResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _inputListenerMethodOnEventName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _inputListenerMethodOnEventName,
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

  InputListener get impl => _impl;
  set impl(InputListener d) {
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
    return "_InputListenerStubControl($superString)";
  }

  int get version => 0;
}

class InputListenerStub
    extends bindings.Stub<InputListener>
    implements InputListener,
               InputListenerInterface,
               InputListenerInterfaceRequest {
  InputListenerStub.unbound([InputListener impl])
      : super(new _InputListenerStubControl.unbound(impl));

  InputListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [InputListener impl])
      : super(new _InputListenerStubControl.fromEndpoint(endpoint, impl));

  InputListenerStub.fromHandle(
      core.MojoHandle handle, [InputListener impl])
      : super(new _InputListenerStubControl.fromHandle(handle, impl));

  static InputListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For InputListenerStub"));
    return new InputListenerStub.fromEndpoint(endpoint);
  }


  dynamic onEvent(input_events_mojom.Event event,[Function responseFactory = null]) {
    return impl.onEvent(event,responseFactory);
  }
}



