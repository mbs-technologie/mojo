// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library shelf.io_server;

import 'dart:async';

import 'dart:io';

import '../shelf_io.dart';
import 'handler.dart';
import 'server.dart';

/// A [Server] backed by a `dart:io` [HttpServer].
class IOServer implements Server {
  /// The underlying [HttpServer].
  final HttpServer server;

  /// Whether [mount] has been called.
  bool _mounted = false;

  Uri get url {
    if (server.address.isLoopback) {
      return new Uri(scheme: "http", host: "localhost", port: server.port);
    }

    // IPv6 addresses in URLs need to be enclosed in square brackets to avoid
    // URL ambiguity with the ":" in the address.
    if (server.address.type == InternetAddressType.IP_V6) {
      return new Uri(
          scheme: "http",
          host: "[${server.address.address}]",
          port: server.port);
    }

    return new Uri(
        scheme: "http", host: server.address.address, port: server.port);
  }

  /// Calls [HttpServer.bind] and wraps the result in an [IOServer].
  static Future<IOServer> bind(address, int port, {int backlog}) async {
    backlog ??= 0;
    var server = await HttpServer.bind(address, port, backlog: backlog);
    return new IOServer(server);
  }

  IOServer(this.server);

  void mount(Handler handler) {
    if (_mounted) {
      throw new StateError("Can't mount two handlers for the same server.");
    }
    _mounted = true;

    serveRequests(server, handler);
  }

  Future close() => server.close();
}
