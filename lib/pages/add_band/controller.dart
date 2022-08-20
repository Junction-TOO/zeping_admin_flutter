import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_band_app_flutter/data/modules/band/controller.dart';

class AddBandPageController extends GetxController {
  AddBandPageController();
  BandController bandController = Get.find<BandController>();
  TextEditingController textEditingController = TextEditingController();
  Future<void> addBand() async {
    await bandController.addBand(textEditingController.text);

    Get.back();
  }
}
