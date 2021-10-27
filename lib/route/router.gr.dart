// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:camera/camera.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../camera/camera_screen.dart' as _i4;
import '../home/home_screen.dart' as _i2;
import '../report/report_screen.dart' as _i3;
import '../splash/splash_screen.dart' as _i1;

class MirrorRouter extends _i5.RootStackRouter {
  MirrorRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    ReportScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ReportScreenRouteArgs>(
          orElse: () => const ReportScreenRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ReportScreen(key: args.key));
    },
    CameraAppRoute.name: (routeData) {
      final args = routeData.argsAs<CameraAppRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.CameraApp(args.cameras));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i5.RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        _i5.RouteConfig(ReportScreenRoute.name, path: '/report-screen'),
        _i5.RouteConfig(CameraAppRoute.name, path: '/camera-app')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for [_i3.ReportScreen]
class ReportScreenRoute extends _i5.PageRouteInfo<ReportScreenRouteArgs> {
  ReportScreenRoute({_i7.Key? key})
      : super(name,
            path: '/report-screen', args: ReportScreenRouteArgs(key: key));

  static const String name = 'ReportScreenRoute';
}

class ReportScreenRouteArgs {
  const ReportScreenRouteArgs({this.key});

  final _i7.Key? key;
}

/// generated route for [_i4.CameraApp]
class CameraAppRoute extends _i5.PageRouteInfo<CameraAppRouteArgs> {
  CameraAppRoute({required List<_i8.CameraDescription> cameras})
      : super(name,
            path: '/camera-app', args: CameraAppRouteArgs(cameras: cameras));

  static const String name = 'CameraAppRoute';
}

class CameraAppRouteArgs {
  const CameraAppRouteArgs({required this.cameras});

  final List<_i8.CameraDescription> cameras;
}
