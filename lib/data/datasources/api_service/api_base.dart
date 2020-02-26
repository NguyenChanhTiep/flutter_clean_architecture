import 'package:dio/dio.dart';
import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/state.dart';
import 'package:meta/meta.dart';

import 'requests/base_request.dart';

void runTestHttp() {}

typedef ConvertJsonToObject<T> = T Function(Map<String, dynamic> json);

class ApiService {
  Dio _dio;
  final _baseUrl = 'https://api.themoviedb.org/3';

  ApiService() {
    _dio = new Dio(BaseOptions(baseUrl: _baseUrl));
    _dio.interceptors.add(CustomInterceptors());
  }

  Future<State<T, Failure>> request<T>({
    @required BaseRequest request,
    @required ConvertJsonToObject<T> convertJsonToObject,
  }) async {
    Future<Response> response;
    switch (request.method) {
      case RequestMethod.GET:
        response =
            _dio.get(request.path, queryParameters: request.queryParameters);
        break;
      case RequestMethod.POST:
        response = _dio.post(request.path,
            queryParameters: request.queryParameters, data: request.body);
        break;
    }

    try {
      final result = await response;
      final Map<String, dynamic> json = result.data;
      final T object = convertJsonToObject(json);
      return State.success(object);
    } on DioError catch (e) {
      final failure = ServerFailure.fromJson(e.response.data);
      return State.error(failure);
    }
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}
