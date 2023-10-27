import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deliveristo/core/data/network/api_endpoint.dart';
import 'package:deliveristo/core/data/network/api_helper.dart';
import 'package:deliveristo/core/di/injection.dart';
import 'package:deliveristo/utils/exception/failure.dart';
import 'package:injectable/injectable.dart';

abstract class DogRepo {
  Future<Either<Failure, String>> randomImageByBread();
  Future<Either<Failure, List<String>>> imageListByBreed();
  Future<Either<Failure, List<String>>> subBreedList();
  Future<Either<Failure, String>> randomImageBySubBreed(String subBreed);
  Future<Either<Failure, List<String>>> imgListBySubBreed(String subBreed);
}

@Injectable(as: DogRepo)
class DogRepoImp extends DogRepo{

  final _apiHelper = getIt<APIHelper>();

  @override
  Future<Either<Failure, String>> randomImageByBread() async{
    final response = await _apiHelper.get(ApiEndpoint.imageRandomByBreed);
    return response.fold((l) => left(l), (r) {
      return right(r.data['message']);
    });
  }

  @override
  Future<Either<Failure, List<String>>> imageListByBreed() async{
    final response = await _apiHelper.get(ApiEndpoint.imageListByBreed);
    return response.fold((l) => left(l), (r) {
      final response = (r.data['message'] as List).map((e) => e.toString()).toList();
      return right(response);
    });
  }

  @override
  Future<Either<Failure, List<String>>> subBreedList() async{
    final response = await _apiHelper.get(ApiEndpoint.subBreedList);
    return response.fold((l) => left(l), (r) {
      final response = (r.data['message'] as List).map((e) => e.toString()).toList();
      return right(response);
    });
  }

  @override
  Future<Either<Failure, String>> randomImageBySubBreed(String subBreed) async{
    final response = await _apiHelper.get(ApiEndpoint.randomImageBySubBreed(subBreed));
    return response.fold((l) => left(l), (r) {
      return right(r.data['message']);
    });
  }

  @override
  Future<Either<Failure, List<String>>> imgListBySubBreed(String subBreed) async{
    final response = await _apiHelper.get(ApiEndpoint.imgListBySubBreed(subBreed));
    return response.fold((l) => left(l), (r) {
      final response = (r.data['message'] as List).map((e) => e.toString()).toList();
      return right(response);
    });
  }
}
