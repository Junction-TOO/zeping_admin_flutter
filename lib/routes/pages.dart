import 'package:get/get.dart';
import 'package:too_band_app_flutter/pages/add_band/binding.dart';
import 'package:too_band_app_flutter/pages/add_band/page.dart';
import 'package:too_band_app_flutter/pages/band/binding.dart';
import 'package:too_band_app_flutter/pages/band/page.dart';
import 'package:too_band_app_flutter/pages/home/binnding.dart';
import 'package:too_band_app_flutter/pages/home/page.dart';
import 'package:too_band_app_flutter/pages/test/page.dart';
import 'package:too_band_app_flutter/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => const HomePage(), binding: HomePageBinding()),
    GetPage(name: Routes.TEST, page: () => const TestPage()),
    GetPage(name: Routes.BAND, page: () => const BandPage(), binding: BandPageBinding()),
    GetPage(name: Routes.ADDBAND, page: () => const AddBandPage(), binding: AddBandPageBinding()),
  ];
}
