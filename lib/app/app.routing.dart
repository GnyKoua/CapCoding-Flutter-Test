import 'package:get/get.dart';
import 'package:capcoding/app/routes.dart';
import 'package:capcoding/ui/screens/splash/splash.screen.dart';

class AppRouting {
  static final List<GetPage> appRoutes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 350),
    ),
  ];
}
