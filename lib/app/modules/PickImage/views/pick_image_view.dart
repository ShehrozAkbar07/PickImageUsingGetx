import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/pick_image_controller.dart';

class PickImageView extends GetView<PickImageController> {
  PickImageController pick_image_controller = Get.put(PickImageController());
  PickImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PickImageView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Obx((() => pick_image_controller.selectedImagePath.value == ""
                  ? const Text(
                      "Select image from Gallery or Camera",
                      style: TextStyle(fontSize: 24),
                    )
                  : Image.file(
                      File(pick_image_controller.selectedImagePath.value)))),
              ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.camera);
                  },
                  child: const Text("Camera")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  child: const Text("Gallery"))
            ],
          ),
        ));
  }
}
