import 'package:get/get.dart';
import 'package:too_band_app_flutter/pages/band/controller.dart';

class BandPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BandPageController>(() => BandPageController());
  }
}
