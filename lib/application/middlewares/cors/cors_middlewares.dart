import 'dart:io';

import 'package:cuidapet_api/application/middlewares/middlewares.dart';
import 'package:shelf/src/response.dart';
import 'package:shelf/src/request.dart';

class CorsMiddlewares extends Middlewares {
  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers':
        '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}',
  };

  @override
  Future<Response> execute(Request request) {}
}
