// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:deliveristo/ui/dashboard/screen.dart' as _i1;
import 'package:deliveristo/ui/image_viewer/screen.dart' as _i2;
import 'package:deliveristo/ui/welcome/welcome_screen.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DashboardScreen(key: args.key),
      );
    },
    ImageViewRoute.name: (routeData) {
      final args = routeData.argsAs<ImageViewRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ImageViewScreen(
          args.url,
          key: args.key,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i4.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i4.PageInfo<DashboardRouteArgs> page =
      _i4.PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ImageViewScreen]
class ImageViewRoute extends _i4.PageRouteInfo<ImageViewRouteArgs> {
  ImageViewRoute({
    required String url,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ImageViewRoute.name,
          args: ImageViewRouteArgs(
            url: url,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageViewRoute';

  static const _i4.PageInfo<ImageViewRouteArgs> page =
      _i4.PageInfo<ImageViewRouteArgs>(name);
}

class ImageViewRouteArgs {
  const ImageViewRouteArgs({
    required this.url,
    this.key,
  });

  final String url;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ImageViewRouteArgs{url: $url, key: $key}';
  }
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeRoute extends _i4.PageRouteInfo<void> {
  const WelcomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
