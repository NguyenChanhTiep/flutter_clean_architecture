import 'package:meta/meta.dart';

enum RequestMethod { GET, POST }

extension on RequestMethod {
  String methodString() {
    BaseRequest(path: '/movie/3', method: RequestMethod.POST);
    switch (this) {
      case RequestMethod.GET:
        return 'GET';
      case RequestMethod.POST:
        return 'POST';
      default:
        return 'GET';
    }
  }
}

class BaseRequest {
  Map<String, dynamic> queryParameters;
  Map<String, dynamic> body;
  RequestMethod method;
  String path;

  BaseRequest({
    @required this.path,
    @required this.method,
    this.body,
    this.queryParameters,
  })  : assert(path != null),
        assert(method != null);

  factory BaseRequest.getRequest({
    @required String path,
    Map<String, dynamic> queryParameters,
  }) {
    return BaseRequest(
      path: path,
      method: RequestMethod.GET,
      queryParameters: queryParameters,
    );
  }

  factory BaseRequest.postRequest({
    @required String path,
    @required Map<String, dynamic> body,
    Map<String, dynamic> queryParameters,
  }) {
    return BaseRequest(
      path: path,
      method: RequestMethod.POST,
      body: body,
      queryParameters: queryParameters,
    );
  }
}
