import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:too_band_app_flutter/data/modules/band/model.dart';

class LogInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.requestOptions.method}[${response.statusCode}] => PATH: ${response.requestOptions.path}', name: 'DIO');
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      log('${err.response!.requestOptions.method}[${err.response!.statusCode}] => PATH: ${err.response!.requestOptions.path}', name: 'DIO');
    }
    handler.next(err);
  }
}

class ApiProvider {
  final Dio dio = Dio();
  final baseUrl = 'https://api1.too.gold';

  ApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(LogInterceptor());
  }

  Future<List<Band>> fetchBands() async {
    String url = '/band?type=get';

    Response response = await dio.get(url);

    return (response.data['data'] as List).map<Band>((model) => Band.fromJson(model)).toList();
  }

  Future<void> addBand(String bandId) async {
    String url = '/band?type=add&bandId=$bandId';

    await dio.get(url);
  }

  Future<String> register({required String childName, required String parentPhone, required String bandId}) async {
    String url = '/user?type=add';
    Response response = await dio.get(url, queryParameters: {'userName': childName, 'phoneNumber': parentPhone, 'bandId': bandId});
    return response.data['data']['url'].toString();
  }

  Future<void> unRegister(String bandId) async {
    String url = '/user?type=del';
    await dio.get(url, queryParameters: {'bandId': bandId});
  }
}
