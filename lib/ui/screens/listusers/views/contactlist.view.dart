import 'package:capcoding/features/contact/contact.controller.dart';
import 'package:capcoding/ui/screens/listusers/widgets/contactitem.widget.dart';
import 'package:capcoding/ui/widgets/spinner.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListView extends GetView<ContactController> {
  const ContactListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Column(
          children: state!
              .map(
                (element) => ContactItemWidget(
                  item: element,
                  onClick: () {
                    // controller.contactService.activeContact = element.obs;
                    // Get.toNamed(Routes.detailscontact);
                  },
                ),
              )
              .toList(),
        );
      },
      onError: (error) {
        return Center(
          child: Text(error!),
        );
      },
      onLoading: SizedBox(
        height: MediaQuery.of(context).size.height * 2 / 3,
        child: const Center(
          child: SpinnerWidget(),
        ),
      ),
      onEmpty: const Center(
        child: Text("Aucun contact trouvé"),
      ),
    );
  }
}
