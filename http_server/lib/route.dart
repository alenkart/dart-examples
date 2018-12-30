import 'commons.dart';

typedef RequestHandler = Function(HttpContext ctx);

class Route {
  String method;
  String path;
  RegExp regExp;
  RequestHandler handler;
  RequestHandler errorHandler;

  Route({method = 'GET', this.path, this.handler, this.errorHandler}) {
    this.method = method.toUpperCase();
    this.regExp = RegExp(path);
  }
}
