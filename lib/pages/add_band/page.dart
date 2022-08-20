import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:too_band_app_flutter/pages/add_band/controller.dart';
import 'package:too_band_app_flutter/widgets/button.dart';

class AddBandPage extends GetView<AddBandPageController> {
  const AddBandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Expanded(
                        child: Text(
                      'Add a new band',
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    )),
                    TextField(
                      controller: controller.textEditingController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: const InputDecoration(
                        labelText: 'band id',
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            CTAButton(
              'Add',
              onTap: controller.addBand,
              padding: const EdgeInsets.all(24),
            ),
          ],
        ),
      ),
    );
  }
}
