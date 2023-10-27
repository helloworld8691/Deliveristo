class ApiEndpoint {
  static const String imageRandomByBreed  = 'breed/hound/images/random';
  static const String imageListByBreed = 'breed/hound/images';
  static const String subBreedList = 'breed/hound/list';
  static String randomImageBySubBreed(String subBreed) => 'breed/hound/$subBreed/images/random';
  static String imgListBySubBreed(String subBreed) => 'breed/hound/$subBreed/images';
}