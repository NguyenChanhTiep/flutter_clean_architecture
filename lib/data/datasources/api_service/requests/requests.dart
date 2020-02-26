import 'base_request.dart';
import 'package:meta/meta.dart';

class GetPopularMoviesRequest extends BaseRequest {
  GetPopularMoviesRequest({@required String apiKey})
      : super(
            path: '/movie/popular',
            method: RequestMethod.GET,
            queryParameters: {
              'api_key': apiKey,
              'page': 1,
            });
}
