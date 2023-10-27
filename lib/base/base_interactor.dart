import 'package:deliveristo/core/di/injection.dart';

abstract class BaseInteractor<T extends Object> {
  final T interactor;
  BaseInteractor(): interactor = getIt<T>();
}