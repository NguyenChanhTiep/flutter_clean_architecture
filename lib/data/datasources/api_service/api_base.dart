import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';
import 'package:meta/meta.dart';

import 'requests/base_request.dart';

void runTestHttp() {}

typedef Mapper<T> = T Function(Map<String, dynamic> json);

class ApiService {
  final Dio _dio;

  ApiService({@required Dio dio}): this._dio = dio;

  Future<State<T, Failure>> request<T>({
    @required BaseRequest request,
    @required Mapper<T> mapper,
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
      final T object = mapper(json);
      return State.success(object);
    } on DioError catch (e) {
      final failure = ServerFailure.fromJson(e.response.data);
      return State.error(failure);
    }
  }
}
