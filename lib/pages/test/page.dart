import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_band_app_flutter/routes/routes.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            child: const Text("HOME"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.BAND);
            },
            child: const Text("BAND"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.ADDBAND);
            },
            child: const Text("ADDBAND"),
          ),
        ],
      ),
    );
  }
}
