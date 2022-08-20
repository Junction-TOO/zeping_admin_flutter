import 'package:get/get.dart';
import 'package:too_band_app_flutter/data/modules/band/model.dart';
import 'package:too_band_app_flutter/data/provider/api.dart';

class BandController extends GetxController with StateMixin<List<Band>> {
  ApiProvider apiProvider;
  BandController(this.apiProvider);

  final Rx<List<Band>> _bands = Rx([]);
  List<Band> get bands => _bands.value;

  @override
  void onInit() {
    fetchBands();
    super.onInit();
  }

  Future<void> fetchBands() async {
    try {
      change(bands, status: RxStatus.loading());
      _bands.value = await apiProvider.fetchBands();
      change(bands, status: RxStatus.success());
    } catch (e) {
      change(bands, status: RxStatus.error());
    }
  }

  Future<void> addBand(String bandId) async {
    await apiProvider.addBand(bandId);
    _bands.value.add(Band(bandId: bandId));
    _bands.refresh();
  }

  Future<void> register({required String childName, required String parentPhone, required String bandId}) async {
    String url = await apiProvider.register(childName: childName, parentPhone: parentPhone, bandId: bandId);
    Band band = _bands.value.firstWhere((band) => band.bandId == bandId);
    band.userName = childName;
    band.phoneNumber = parentPhone;
    band.url = url;
    _bands.refresh();
  }

  Future<void> unRegister(String bandId) async {
    await apiProvider.unRegister(bandId);
    Band band = _bands.value.firstWhere((band) => band.bandId == bandId);
    band.userName = null;
    band.phoneNumber = null;
    band.url = null;
    _bands.refresh();
  }
}
