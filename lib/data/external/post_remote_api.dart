import 'package:best_architecture_challenge/app/app_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class PostRemoteApi {
  final Dio _dio;

  PostRemoteApi({required AppConfig appConfig})
      : _dio = Dio(BaseOptions(
          baseUrl: appConfig.apiDomain,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ));

  Future<dynamic> get() async {
    var response = await _dio.get("/posts");
    return response.data;
  }
}
