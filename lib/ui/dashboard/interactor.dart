import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:deliveristo/base/base_interactor.dart';
import 'package:deliveristo/core/data/network/repository/dog_repo.dart';
import 'package:deliveristo/utils/exception/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardInteractor extends BaseInteractor<DogRepo>{
  Future<Either<Failure, String>> getRandomImage() => interactor.randomImageByBread();
  Future<Either<Failure, List<String>>> getImageListByBreed() => interactor.imageListByBreed();
  Future<Either<Failure, List<String>>> getSubBreedList() => interactor.subBreedList();
  Future<Either<Failure, String>> getRandomImageBySubBreed(String subBreed) => interactor.randomImageBySubBreed(subBreed);
  Future<Either<Failure, List<String>>> getImgListBySubBreed(String subBreed) => interactor.imgListBySubBreed(subBreed);
}