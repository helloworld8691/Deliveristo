import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'route.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends $AppRouter{

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: ImageViewRoute.page)
  ];
}