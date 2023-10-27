import 'package:flutter/cupertino.dart';

extension WidgetExt on Widget {
  Center get toCenter => Center(child: this);
  Flexible get toFlexible => Flexible(child: this);
}