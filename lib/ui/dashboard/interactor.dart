import 'dart:async';
import 'package:deliveristo/base/base_interactor.dart';
import 'package:deliveristo/core/data/network/repository/dog_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardInteractor extends BaseInteractor<DogRepo>{
  Future<String> getRandomImage() => interactor.randomImageByBread();
  Future<List<String>> getImageListByBreed() => interactor.imageListByBreed();
  Future<List<String>> getSubBreedList() => interactor.subBreedList();
  Future<String> getRandomImageBySubBreed(String subBreed) => interactor.randomImageBySubBreed(subBreed);
  Future<List<String>> getImgListBySubBreed(String subBreed) => interactor.imgListBySubBreed(subBreed);
}