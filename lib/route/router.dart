import 'package:auto_route/annotations.dart';
import 'package:mirror/camera/camera_screen.dart';
import 'package:mirror/home/home_screen.dart';
import 'package:mirror/report/report_screen.dart';
import 'package:mirror/splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ReportScreen),
    AutoRoute(page: CameraApp),
  ],
)
class $MirrorRouter {}
