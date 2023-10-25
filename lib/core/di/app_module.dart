import 'package:deliveristo/core/routers/route.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const token = "";
    options.headers.update("Authorization", (value) => token, ifAbsent: () => token);
    super.onRequest(options, handler);
  }
}

Dio get dio => Dio()
  ..options = BaseOptions(baseUrl: "", connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(seconds: 30))
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(LogInterceptor(responseBody: true, request: true));

final appRouter = AppRouter();