import 'dart:io';

class HttpContext {
  HttpRequest request;
  HttpResponse response;

  HttpContext(this.request) : this.response = request.response;

  write(
    dynamic content, {
    statusCode = 200,
    contentType = 'text/plain',
  }) {
    request.response
      ..headers.add(HttpHeaders.contentTypeHeader, contentType)
      ..statusCode = statusCode
      ..write(content)
      ..close();
  }

  error404() => this.write(
        '<h1>Page not found</h1>',
        statusCode: 404,
        contentType: 'text/html',
      );

  error505() => this.write(
        '<h1>Internal server error</h1>',
        statusCode: 500,
        contentType: 'text/html',
      );
}
