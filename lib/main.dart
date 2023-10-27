import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant/theme.dart';
import 'core/di/app_module.dart';
import 'core/di/injection.dart';
//import 'package:device_preview/device_preview.dart';  // uncomment this one if you want to check app in different phone size

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(
      MyApp()
      // uncomment this one if you want to check app in different phone size
      /*DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp()
      )*/
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key}){
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..indicatorSize = 35.0
      ..radius = 5.0

      ..userInteractions = false;
  }

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(390, 844), // this is the screen size in Figma design
        builder: (context, child){
          return MaterialApp.router(
            theme: appTheme,
            title: "TestProject",
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.config(),
            builder: EasyLoading.init(),
          );
        }
    );
  }
}
