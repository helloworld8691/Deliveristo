import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant/theme.dart';
import 'core/di/app_module.dart';
import 'core/di/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}){
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 40
      ..textColor = Colors.black
      ..radius = 10
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.white
      ..indicatorColor = Colors.white54
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.ring
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
