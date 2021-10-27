import 'package:auto_route/annotations.dart';
import 'package:mirror/home/home_screen.dart';
import 'package:mirror/splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen),
  ],
)
class $MirrorRouter {}
