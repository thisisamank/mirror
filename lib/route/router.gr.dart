// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i5;

import '../home/home_screen.dart' as _i2;
import '../report/report_screen.dart' as _i3;
import '../splash/splash_screen.dart' as _i1;

class MirrorRouter extends _i4.RootStackRouter {
  MirrorRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    ReportScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ReportScreenRouteArgs>(
          orElse: () => const ReportScreenRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ReportScreen(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        _i4.RouteConfig(ReportScreenRoute.name, path: '/report-screen')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for [_i3.ReportScreen]
class ReportScreenRoute extends _i4.PageRouteInfo<ReportScreenRouteArgs> {
  ReportScreenRoute({_i6.Key? key})
      : super(name,
            path: '/report-screen', args: ReportScreenRouteArgs(key: key));

  static const String name = 'ReportScreenRoute';
}

class ReportScreenRouteArgs {
  const ReportScreenRouteArgs({this.key});

  final _i6.Key? key;
}
