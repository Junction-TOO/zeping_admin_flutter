import 'package:get/get.dart';
import 'package:too_band_app_flutter/pages/add_band/controller.dart';

class AddBandPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBandPageController>(() => AddBandPageController());
  }
}
