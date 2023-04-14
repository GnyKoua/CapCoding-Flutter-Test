import 'package:capcoding/features/contact/contact.controller.dart';
import 'package:capcoding/features/contact/contact.service.dart';
import 'package:capcoding/ui/screens/listusers/views/contactlist.view.dart';
import 'package:capcoding/ui/styles/colors.style.dart';
import 'package:capcoding/ui/widgets/refresher.widget.dart';
import 'package:capcoding/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListUsersScreen extends StatefulWidget {
  const ListUsersScreen({super.key});

  @override
  State<ListUsersScreen> createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> {
  final _contactService = Get.find<ContactService>();
  final _contactController = Get.find<ContactController>();
  TextEditingController filter = TextEditingController();

  @override
  void initState() {
    super.initState();

    filter.addListener(() {
      _contactController.filterContacts(filter.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    filter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            "Liste des utilisateurs (${_contactService.contacts.length})",
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 25,
                  color: lightColor,
                ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                primaryColor,
                primaryConstratColor,
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextField(
                controller: filter,
                style: Theme.of(context).textTheme.bodyMedium,
                cursorColor: textSecondaryColor,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  hintText: "Cherchez un utilisateur...",
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      makeAssetName("icons/search.svg"),
                      width: 25,
                      color: textSecondaryColor,
                    ),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      filter.clear();
                    },
                    child: SvgPicture.asset(
                      makeAssetName("icons/clear-circle.svg"),
                      width: 20,
                    ),
                  ),
                  fillColor: greyColor.withOpacity(0.15),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: primaryConstratColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: dangerColor, width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: dangerColor, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: RefresherWidget(
              onRefresh: () async {
                _contactController.refreshContacts();
              },
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ContactListView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
