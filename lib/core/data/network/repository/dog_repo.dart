import 'dart:async';

import 'package:deliveristo/core/data/network/api_endpoint.dart';
import 'package:deliveristo/core/data/network/api_helper.dart';
import 'package:deliveristo/core/di/injection.dart';
import 'package:injectable/injectable.dart';

abstract class DogRepo {
  Future<String> randomImageByBread();
  Future<List<String>> imageListByBreed();
  Future<List<String>> subBreedList();
  Future<String> randomImageBySubBreed(String subBreed);
  Future<List<String>> imgListBySubBreed(String subBreed);
}

@Injectable(as: DogRepo)
class DogRepoImp extends DogRepo{

  final _apiHelper = getIt<APIHelper>();

  @override
  Future<String> randomImageByBread() async{
    final response = await _apiHelper.get(ApiEndpoint.imageRandomByBreed);
    return response['message'];
  }

  @override
  Future<List<String>> imageListByBreed() async{
    final response = await _apiHelper.get(ApiEndpoint.imageListByBreed);
    return (response['message'] as List).map((e) => e.toString()).toList();
  }

  @override
  Future<List<String>> subBreedList() async{
    final response = await _apiHelper.get(ApiEndpoint.subBreedList);
    return (response['message'] as List).map((e) => e.toString()).toList();
  }

  @override
  Future<String> randomImageBySubBreed(String subBreed) async{
    final response = await _apiHelper.get(ApiEndpoint.randomImageBySubBreed(subBreed));
    return response['message'];
  }

  @override
  Future<List<String>> imgListBySubBreed(String subBreed) async{
    final response = await _apiHelper.get(ApiEndpoint.imgListBySubBreed(subBreed));
    return (response['message'] as List).map((e) => e.toString()).toList();
  }
}
