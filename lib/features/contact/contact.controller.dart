import 'package:capcoding/features/contact/contact.service.dart';
import 'package:capcoding/features/contact/models/random_user_response/contact.dart';
import 'package:get/get.dart';

class ContactController extends GetxController
    with StateMixin<RxList<Contact>> {
  final contactService = Get.find<ContactService>();

  @override
  void onInit() {
    super.onInit();
    _loadContacts();
  }

  _loadContacts() async {
    try {
      var res = await contactService.getManyContacts(50);
      change(res!.obs,
          status: res.isNotEmpty ? RxStatus.success() : RxStatus.empty());
    } catch (e) {
      change(<Contact>[].obs, status: RxStatus.error(e.toString()));
    }
  }

  refreshContacts() async {
    change(<Contact>[].obs, status: RxStatus.loading());
    _loadContacts();
  }

  filterContacts(String? filter) async {
    if (filter != null) {
      var res = contactService.contacts.where((p0) {
        return p0.phone!.contains(filter) ||
            p0.name!.first!.toLowerCase().contains(filter.toLowerCase()) ||
            p0.name!.last!.toLowerCase().contains(filter.toLowerCase());
      }).toList();
      change(res.obs,
          status: res.isNotEmpty ? RxStatus.success() : RxStatus.empty());
    } else {
      change(contactService.contacts,
          status: contactService.contacts.isNotEmpty
              ? RxStatus.success()
              : RxStatus.empty());
    }
  }
}
