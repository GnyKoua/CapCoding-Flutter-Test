import 'package:capcoding/features/contact/contact.provider.dart';
import 'package:capcoding/features/contact/models/random_user_response/contact.dart';
import 'package:get/get.dart';

class ContactService extends GetxService {
  final _contactProvider = ContactProvider();
  RxList<Contact> contacts = <Contact>[].obs;
  // Rx<Contact?> activeContact = null.obs;

  Future<List<Contact>?> getManyContacts(int nbre) async {
    try {
      var resp = await _contactProvider.getContacts(nbre <= 0 ? 1 : nbre);

      if (resp.body == null) {
        throw "Body is null";
      }
      var user = resp.body?.results;
      if (user != null) {
        contacts.clear();
        contacts.addAll(user);
      }

      return resp.body?.results;
    } catch (e) {
      throw e.toString();
    }
  }
}
