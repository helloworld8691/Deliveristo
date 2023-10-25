import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../core/di/injection.dart';

abstract class BaseViewModel<T extends Object> with ChangeNotifier {
  final T interactor;
  BaseViewModel(): interactor = getIt<T>();

  CompositeSubscription compositeSubscription = CompositeSubscription();

  addSubscription(StreamSubscription subscription){
    compositeSubscription.add(subscription);
  }

  callInteractor(Stream data){

  }


  @override
  void dispose() {
    if (!compositeSubscription.isDisposed){
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}