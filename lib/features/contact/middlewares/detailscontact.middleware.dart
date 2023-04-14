import 'package:capcoding/app/routes.dart';
import 'package:capcoding/features/contact/contact.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsContactMiddleware extends GetMiddleware {
  final _contactService = Get.find<ContactService>();
  @override
  RouteSettings? redirect(String? route) {
    return _contactService.activeContact.value != null
        ? null
        : const RouteSettings(name: Routes.listcontacts);
  }
}
