import 'package:dio/dio.dart';
late Dio dio;
//https://newsapi.org/v2/top-headlines
class diohelper {
  static late Dio dio;
  Future<Response> response = dio.get('v2/top-headlines', queryParameters: {
    'country': 'eg',
    'category': 'business',
    'apiKey': '95d3f47de5b147119e88ef61671775ab'
  });
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org', receiveDataWhenStatusError: false),
    );
  }

  static Future<dynamic> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
