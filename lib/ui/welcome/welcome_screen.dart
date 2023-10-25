import 'package:auto_route/annotations.dart';
import 'package:deliveristo/core/di/app_module.dart';
import 'package:deliveristo/core/routers/route.gr.dart';
import 'package:deliveristo/extension/string_ext.dart';
import 'package:deliveristo/extension/widget_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Developer details'.toText(fontSize: 20),
          20.verticalSpace,
          'Name: Viktor Kostic'.toText(),
          5.verticalSpace,
          'email: kosticviktor2@gmail.com'.toText(),
          50.verticalSpace,
          'Start Test'.toButton(() => appRouter.replace(DashboardRoute()))
        ],
      ).toCenter,
    );
  }
}
