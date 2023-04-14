import 'package:capcoding/app/app.dart';
import 'package:capcoding/features/constants.feature.dart';
import 'package:capcoding/features/contact/contact.service.dart';
import 'package:capcoding/features/theme/theme.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Initiation des services API et injections des services et controlleurs de GetX
Future<void> initServices() async {
  await GetStorage.init(STORAGE_KEY);

  Get.put(ThemeController());
  Get.put(ContactService());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    // Set device orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Set status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  //Load Services
  initServices().then((value) async {
    runApp(const MainApp());
  });
}
