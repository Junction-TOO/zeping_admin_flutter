import 'package:get/get.dart';
import 'package:too_band_app_flutter/data/modules/band/controller.dart';
import 'package:too_band_app_flutter/data/modules/band/model.dart';

class HomePageController extends GetxController {
  final BandController bandController = Get.find<BandController>();
  final Rx<List<Band>> _inUseBand = Rx([]);
  final Rx<List<Band>> _idleBand = Rx([]);

  List<Band> get inUseBand => _inUseBand.value;
  List<Band> get idleBand => _idleBand.value;

  Future<void> fetchBands() async {
    await bandController.fetchBands();
    _inUseBand.value = bandController.bands.where((band) => band.url != null).toList();
    _idleBand.value = bandController.bands.where((band) => band.url == null).toList();
  }
}
