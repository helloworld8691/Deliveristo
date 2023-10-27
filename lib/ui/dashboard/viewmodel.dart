import 'dart:async';

import 'package:deliveristo/base/base_viewmodel.dart';
import 'package:deliveristo/ui/dashboard/interactor.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

enum Menu{
  byBreed,
  bySubBreed
}

@injectable
class DashboardViewModel extends BaseViewModel<DashboardInteractor>{

  String _randomImg = '';
  String get randomImage => _randomImg;

  List<String> _imageListByBreed = [];
  List<String> get imageListByBreed => _imageListByBreed;

  List<KtPair<String, bool>> _subBreedList = [];
  List<KtPair<String, bool>> get subBreedList => _subBreedList;

  String _randomImgBySubBreed = '';
  String get randomImgBySubBreed => _randomImgBySubBreed;

  List<String> _imgListBySubBreed = [];
  List<String> get imgListBySubBreed => _imgListBySubBreed;

  Menu selectedMenu = Menu.byBreed;
  String _subBreed = '';

  Timer? _timer;

  @override
  void init() {
    _startSec10Timer();
    _getImageListByBreed();
    _getSubBreedList();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startSec10Timer(){
    _timer = _sec10Timer(const Duration(seconds: 20), (p0) {
      if (selectedMenu == Menu.byBreed){
        _getRandomImage();
      }else if (selectedMenu == Menu.bySubBreed && _subBreed.isNotEmpty) {
        _getRandomImgBySubBreed(_subBreed);
      }

    }, fireNow: true);
  }

  Timer _sec10Timer(Duration duration, Function(Timer) callback, {bool fireNow = false}) {
    var timer = Timer.periodic(duration, callback);
    if (fireNow) {
      callback(timer);
    }
    return timer;
  }

  void _getRandomImage() {
    callInteractor(interactor.getRandomImage(), (value) {
      _randomImg = value;
      notifyListeners();
    }, showLoading:  false);
  }

  void _getImageListByBreed(){
    callInteractor(interactor.getImageListByBreed(), (value) {
      _imageListByBreed = value;
      notifyListeners();
    });
  }

  void _getSubBreedList(){
    callInteractor(interactor.getSubBreedList(), (value) {
      final List<KtPair<String, bool>> temp = [];
      for (final item in (value as List<String>)) {
        temp.add(KtPair(item, false));
      }
      temp.first = KtPair(temp.first.first, true);
      _subBreedList = temp;
      notifyListeners();
    });
  }

  void selectMenu(Menu menu){
    selectedMenu = menu;
    if (menu == Menu.bySubBreed && _subBreed.isEmpty) {
      selectSubBreed(0);
    }
  }

  void selectSubBreed(int index){
    _subBreedList[index] = KtPair(_subBreedList[index].first, true);
    _getRandomImgBySubBreed(_subBreedList[index].first);
    _getImgListBySubBreed(_subBreedList[index].first);
    notifyListeners();
  }

  void _getRandomImgBySubBreed(String subBreed) {
    _subBreed = subBreed;
    callInteractor(interactor.getRandomImageBySubBreed(subBreed), (value) {
      _randomImgBySubBreed = value;
      notifyListeners();
    }, showLoading: false);
  }

  void _getImgListBySubBreed(String subBreed) {
    callInteractor(interactor.getImgListBySubBreed(subBreed), (value) {
      _imgListBySubBreed = value;
      notifyListeners();
    });
  }
}