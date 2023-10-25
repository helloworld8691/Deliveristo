import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/di/injection.dart';

abstract class Presenter {
  void onClick(String action);
}

abstract class ItemPresenter<T> {
  void onItemClick(String action, T item);
}

abstract class BaseScreen<T extends ChangeNotifier> extends StatelessWidget implements Presenter {
  final T viewModel;
  BaseScreen({super.key, required List<dynamic> params}): viewModel = getIt<T>();

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: buildContent(context),
    );
  }

  @override
  void onClick(String action) {}
}