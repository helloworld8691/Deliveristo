import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rxdart/rxdart.dart';

import '../core/di/injection.dart';

abstract class BaseViewModel<T extends Object> with ChangeNotifier {

  final T interactor;
  BaseViewModel(): interactor = getIt<T>() {
    init();
  }

  void init();

  CompositeSubscription compositeSubscription = CompositeSubscription();

  addSubscription(StreamSubscription subscription){
    compositeSubscription.add(subscription);
  }

  void callInteractor(Future<dynamic> interactor, Function(dynamic) result, {bool showLoading = true}){
    if (showLoading) {
      EasyLoading.show();
    }
    interactor.then((value) {
      result(value);
      EasyLoading.dismiss();
    });
  }

  @override
  void dispose() {
    if (!compositeSubscription.isDisposed){
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}