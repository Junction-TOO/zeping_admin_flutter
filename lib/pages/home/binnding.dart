import 'package:get/get.dart';
import 'package:too_band_app_flutter/data/modules/band/controller.dart';
import 'package:too_band_app_flutter/data/provider/api.dart';
import 'package:too_band_app_flutter/pages/home/controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BandController>(() => BandController(ApiProvider()));
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
