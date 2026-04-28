import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://forsan-el-t3afy-backend.vercel.app",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }
  static Future<Response> logout({
  required String token,
}) async {
  dio.options.headers = {
    "Authorization": "Bearer $token",
  };
  return await dio.post("/api/family/logout");
}

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data);
  }

  static Future<Response> getData({
    required String url,
    required String token,
  }) async {
    dio.options.headers = {
      "Authorization": "Bearer $token",
    };
    return await dio.get(url);
  }
}