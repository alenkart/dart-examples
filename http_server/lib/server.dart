import 'dart:io';
import 'commons.dart';

class Server {
  String host;
  int port;
  HttpServer server;
  List<Route> routes = List();

  Server({this.host = '127.0.0.1', this.port = 4040});

  _handler(HttpRequest request) {
    final route = getRoute(request.method, request.uri.path);
    final ctx = HttpContext(request);

    try {
      if (route == null || route.handler == null) {
        ctx.error404();
      } else {
        route.handler(ctx);
      }
    } catch (error) {
      print(error);

      if (route == null || route.errorHandler == null) {
        route.errorHandler(ctx);
      } else {
        ctx.error505();
      }
    }
  }

  Route getRoute(String method, String path) {
    for (final route in this.routes) {
      if (method == route.method && route.regExp.hasMatch(path)) {
        return route;
      }
    }
    return null;
  }

  listen([Function() callback]) async {
    if (this.server != null) {
      return;
    }

    this.server = await HttpServer.bind(
      this.host,
      this.port,
    );

    if (callback != null) {
      callback();
    }

    await for (HttpRequest request in server) {
      this._handler(request);
    }
  }
}
