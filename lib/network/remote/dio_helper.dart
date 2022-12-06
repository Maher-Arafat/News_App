import 'package:dio/dio.dart';

//For news App

class NDioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required dynamic query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}


