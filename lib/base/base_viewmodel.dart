import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deliveristo/utils/exception/failure.dart';
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

  void callInteractor(Future<Either<Failure, dynamic>> interactor, Function(dynamic) result, {bool showLoading = true}){
    if (showLoading) {
      EasyLoading.show();
    }
    interactor.then((value) {
      EasyLoading.dismiss();
      value.fold((l) {
        // In here, we can process exception
        EasyLoading.showToast(l.errorMsg);
      }, (r) {
        result(r);
      });
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