import 'package:deliveristo/core/data/network/api_helper.dart';
import 'package:deliveristo/core/di/injection.dart';
import 'package:deliveristo/core/routers/route.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule{

  @lazySingleton
  Dio get dio => Dio()
    ..options = BaseOptions(baseUrl: "https://dog.ceo/api/", connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(seconds: 30))
    ..interceptors.add(AuthInterceptor());
    //..interceptors.add(LogInterceptor(responseBody: true, request: true)); // uncomment this line if you want to see the API request & response log

}

final appRouter = AppRouter();