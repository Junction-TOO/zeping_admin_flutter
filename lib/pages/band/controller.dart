import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:too_band_app_flutter/data/modules/band/controller.dart';
import 'package:too_band_app_flutter/data/modules/band/model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BandPageController extends GetxController {
  final BandController bandController = Get.find<BandController>();
  final TextEditingController childrenNameField = TextEditingController();
  final TextEditingController parentContactField = TextEditingController();
  late Band band;

  @override
  void onInit() {
    band = bandController.bands.where((band) => band.bandId == Get.parameters['bandId']).first;

    super.onInit();
  }

  Future<void> register() async {
    await bandController.register(childName: childrenNameField.text, parentPhone: parentContactField.text, bandId: band.bandId);
    Get.back();
  }

  Future<void> unRegister() async {
    await bandController.unRegister(band.bandId);
    Get.back();
  }

  void copyUserId() {
    Clipboard.setData(ClipboardData(text: band.url));
    Get.snackbar('토큰이 복사되었습니다', band.url!, colorText: Colors.white);
  }

  void linkToPhone() {
    launchUrlString('tel:${band.phoneNumber}');
  }
}
