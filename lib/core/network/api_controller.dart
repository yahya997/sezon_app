import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class ApiController {
  static ApiController instance = ApiController._internal();
  static final dio = Dio();
  ApiController._internal();

  factory ApiController() {
    return instance;
  }

  static Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    String? body,
  }) async {
    var response = await dio.post(url, data:body,options: Options(headers: headers));
    log(response.data.toString());
    return jsonDecode(response.data);
  }
}
