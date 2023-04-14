import 'package:capcoding/features/contact/models/random_user_response/random_user_response.dart';
import 'package:capcoding/features/global/main.provider.dart';
import 'package:get/get.dart';

class ContactProvider extends MainProvider {
  Future<Response<RandomUserResponse>> getContacts(int size) =>
      get<RandomUserResponse>(
        "",
        query: {
          "results": "$size",
        },
        decoder: (data) => RandomUserResponse.fromJson(data),
      );
}
