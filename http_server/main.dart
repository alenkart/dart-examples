import 'dart:convert';
import './lib/commons.dart';

main(List<String> args) {
  final server = Server();

  server.routes.add(
    Route(
      path: r'^\/$',
      method: 'GET',
      handler: (ctx) {
        ctx.write(
          '<h1>Hello world</h1>',
          contentType: 'text/html',
        );
      },
      errorHandler: (ctx) {
        ctx.write(
          'error',
          statusCode: 500,
        );
      },
    ),
  );

  server.routes.add(
    Route(
      path: r'\/(post)$',
      method: 'POST',
      handler: (ctx) {
        ctx.write(
          jsonEncode({'content': 'Hello world'}),
          contentType: 'application/json',
        );
      },
      errorHandler: (ctx) {
        ctx.write(
          jsonEncode({'error': true}),
          statusCode: 500,
          contentType: 'application/json',
        );
      },
    ),
  );

  server.listen(() {
    print('Listening on localhost:${server.port}');
  });
}
