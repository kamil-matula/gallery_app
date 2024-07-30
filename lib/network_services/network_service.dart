import 'package:dio/dio.dart';

class NetworkService {
  static Dio? _api;

  NetworkService() {
    _api ??= Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        headers: {'Content-Type': 'application/json'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response<dynamic>> get(String path) async {
    return await _api!.get(path);
  }

  // TODO: Add post, put, patch, delete (if needed)
}
