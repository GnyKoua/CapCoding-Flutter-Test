import 'package:capcoding/app/routes.dart';
import 'package:capcoding/features/contact/contact.binding.dart';
import 'package:capcoding/ui/screens/listusers/listusers.screen.dart';
import 'package:capcoding/ui/screens/splash/splash.screen.dart';
import 'package:get/get.dart';

class AppRouting {
  static final List<GetPage> appRoutes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.listcontacts,
      page: () => const ListUsersScreen(),
      bindings: [
        ContactBinding(),
      ],
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  ];
}
