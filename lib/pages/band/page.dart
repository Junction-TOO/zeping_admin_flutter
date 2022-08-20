import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:too_band_app_flutter/pages/band/controller.dart';
import 'package:too_band_app_flutter/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class BandPage extends GetView<BandPageController> {
  const BandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.band.userName != null ? const UsingBand() : const WaitingBand();
  }
}

class UsingBand extends GetView<BandPageController> {
  const UsingBand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'band id',
                      style: TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.4)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.band.bandId,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "children's name",
                      style: TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.4)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.band.userName!,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'zep url',
                      style: TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.4)),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        final Uri url = Uri.parse(controller.band.url!);
                        launchUrl(url);
                      },
                      child: Text(
                        controller.band.url!,
                        style: const TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "parent's phone",
                      style: TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.4)),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: controller.linkToPhone,
                      child: Text(
                        controller.band.phoneNumber!,
                        style: const TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              CTAButton(
                'unregister',
                onTap: controller.unRegister,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class WaitingBand extends GetView<BandPageController> {
  const WaitingBand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.band.bandId,
                              style: const TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Band ID',
                              style: TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.4)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextField(
                      controller: controller.childrenNameField,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: const InputDecoration(
                        labelText: 'Children Name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: controller.parentContactField,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: const InputDecoration(
                        labelText: "Parent's Contact",
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            CTAButton(
              'Register',
              onTap: controller.register,
              padding: const EdgeInsets.all(24),
            ),
          ],
        ),
      ),
    );
  }
}
