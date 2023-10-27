import 'package:deliveristo/core/di/injection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class APIHelper{
  final dio = getIt<Dio>();

  Future get(String url, {Map<String, dynamic>? params}) async{
    final response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  Future post(String url, {Map<String, dynamic>? params}) async {
    final response = await dio.post(url, data: params);
    return response.data;
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const token = "";
    options.headers.update("Authorization", (value) => token, ifAbsent: () => token);
    super.onRequest(options, handler);
  }
}