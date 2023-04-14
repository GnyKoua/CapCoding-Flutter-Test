import 'package:cached_network_image/cached_network_image.dart';
import 'package:capcoding/features/contact/contact.service.dart';
import 'package:capcoding/ui/screens/detailcontact/widgets/actiondetailscontact.dart';
import 'package:capcoding/ui/styles/colors.style.dart';
import 'package:capcoding/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:skeletons/skeletons.dart';

class DetailContactScreen extends StatefulWidget {
  const DetailContactScreen({super.key});

  @override
  State<DetailContactScreen> createState() => _DetailContactScreenState();
}

class _DetailContactScreenState extends State<DetailContactScreen> {
  final _contactService = Get.find<ContactService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.5,
              padding: const EdgeInsets.only(
                top: kToolbarHeight * 2 / 3,
                left: 10,
                right: 25,
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          borderRadius: BorderRadius.circular(20),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.chevron_left,
                              color: lightColor,
                              size: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              "Fiche de contact",
                              textAlign: TextAlign.center,
                              style: textTheme.titleMedium?.copyWith(
                                color: lightColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Obx(
                    () => CachedNetworkImage(
                      imageUrl:
                          _contactService.activeContact.value?.picture?.large ??
                              "",
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          height: 150,
                          width: 150,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.error,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.01, bottom: height * 0.005),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  "${_contactService.activeContact.value?.name?.title}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: lightColor,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 2.5),
                              Obx(
                                () => Text(
                                  "${_contactService.activeContact.value?.name?.last}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: lightColor,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 2.5),
                              Obx(
                                () => Text(
                                  "${_contactService.activeContact.value?.name?.first}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: lightColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.015),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  "${_contactService.activeContact.value?.location?.city}, ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: lightColor.withOpacity(0.6),
                                      ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${_contactService.activeContact.value?.location?.state}, ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: lightColor.withOpacity(0.6),
                                      ),
                                ),
                              ),
                              const SizedBox(width: 2.5),
                              Obx(
                                () => Text(
                                  "${_contactService.activeContact.value?.location?.country}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: lightColor.withOpacity(0.6),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.02, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const ActionDetailsContact(
                                svgSrc: "icons/video-call.svg",
                                label: "Appel vidéo",
                                color: Colors.blue,
                              ),
                              ActionDetailsContact(
                                svgSrc: "icons/message-circle-lines.svg",
                                label: "Message",
                                color: Colors.blue.shade900,
                              ),
                              ActionDetailsContact(
                                svgSrc: "icons/call-phone-ui-2.svg",
                                label: "Appel",
                                color: Colors.blue.shade700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.5,
              width: width,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            makeAssetName("icons/birthday-cake.svg"),
                            width: 30,
                            height: 30,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Jiffy(_contactService
                                        .activeContact.value?.dob?.date)
                                    .format("dd/MM/yyyy"),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: textPrimaryColor,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Date de naissance",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.mail_outlined,
                            size: 30,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_contactService.activeContact.value?.email}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: textPrimaryColor,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Email personnel | Travail",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.phone_iphone_outlined,
                            size: 30,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_contactService.activeContact.value?.phone}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: textPrimaryColor,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Téléphone portable",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            makeAssetName("icons/call-phone-ui-2.svg"),
                            width: 30,
                            height: 30,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_contactService.activeContact.value?.cell}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: textPrimaryColor,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Téléphone fixe",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
