import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_band_app_flutter/data/modules/band/controller.dart';
import 'package:too_band_app_flutter/data/modules/band/model.dart';
import 'package:too_band_app_flutter/pages/home/controller.dart';
import 'package:too_band_app_flutter/pages/home/widget/zep_button.dart';
import 'package:too_band_app_flutter/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bands'),
          leading: IconButton(icon: const Icon(Icons.add), onPressed: () => Get.toNamed(Routes.ADDBAND)),
          elevation: 4,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text('in use')),
              Tab(child: Text('idle')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UsingTab(),
            WaitingTab(),
          ],
        ),
      ),
    );
  }
}

class HomePageListItem extends StatelessWidget {
  final String title;
  final String? zepUrl;
  final void Function()? onTap;
  const HomePageListItem({Key? key, required this.title, this.zepUrl, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16),
            ),
            zepUrl == null ? Container() : ZepButton(zepUrl!),
          ],
        ),
      ),
    );
  }
}

class UsingTab extends GetView<HomePageController> {
  final BandController bandController = Get.find<BandController>();
  UsingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bandController.obx(
      (_) {
        return RefreshIndicator(
          color: const Color(0xFF1E2124),
          backgroundColor: Colors.white,
          onRefresh: controller.fetchBands,
          child: Obx(
            () {
              List<Band> items = bandController.bands.where((band) => band.userName != null).toList();
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => HomePageListItem(
                  zepUrl: items[index].url!,
                  title: items[index].bandId,
                  onTap: () => Get.toNamed(Routes.BAND, parameters: {'bandId': items[index].bandId}),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class WaitingTab extends GetView<HomePageController> {
  final BandController bandController = Get.find<BandController>();
  WaitingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bandController.obx(
      (_) {
        return RefreshIndicator(
          color: const Color(0xFF1E2124),
          backgroundColor: Colors.white,
          onRefresh: controller.fetchBands,
          child: Obx(
            () {
              List<Band> items = bandController.bands.where((band) => band.userName == null).toList();
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => HomePageListItem(
                  title: items[index].bandId,
                  onTap: () => Get.toNamed(Routes.BAND, parameters: {'bandId': items[index].bandId}),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
