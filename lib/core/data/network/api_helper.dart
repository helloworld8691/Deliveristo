import 'package:dartz/dartz.dart';
import 'package:deliveristo/core/di/injection.dart';
import 'package:deliveristo/utils/exception/failure.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class APIHelper{
  final dio = getIt<Dio>();

  Future<Either<Failure, Response>> get(String url, {Map<String, dynamic>? params}) async =>
      await _apiRequest(() async{
        final res = await dio.get(url);
        return res;
      });

  Future<Either<Failure, Response>> post(String url, {Map<String, dynamic>? params}) async =>
      await _apiRequest(() async{
        final res = await dio.post(url,);
        return res;
      });

  Future<Either<Failure, Response>> _apiRequest(Future<dynamic> Function() function) async {
    try {
      final Response response = await function.call();
      if (response.statusCode == 200 || response.statusCode == 204 ) {
        return Right(response);
      }

      return Left(ServerFailure('here is error message'));
    } on DioException catch(e){
      _handleDioException(e);
      return Left(ServerFailure('here is error message'));
    }
  }
}

void _handleDioException(DioException exception){
  switch (exception.type){
    case DioExceptionType.connectionTimeout:
      break;
    case DioExceptionType.sendTimeout:
      break;
    case DioExceptionType.receiveTimeout:
      break;
    case DioExceptionType.badCertificate:
      break;
    case DioExceptionType.badResponse:
      break;
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.connectionError:
      break;
    case DioExceptionType.unknown:
      break;
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