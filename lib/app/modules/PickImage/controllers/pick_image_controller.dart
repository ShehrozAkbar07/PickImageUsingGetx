import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  var cropImagePath = "".obs;
  var cropImageSize = "".obs;

  var compressImagePath = "".obs;
  var compressImageSize = "".obs;
  void getImage(ImageSource imageSource) async {
    final PickedFile = await ImagePicker().pickImage(source: imageSource);
    if (PickedFile != null) {
      selectedImagePath.value = PickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";

// //Crop Image
//       final cropImageFile = await ImageCropper().cropImage(
//           sourcePath: selectedImagePath.value,
//           maxHeight: 512,
//           maxWidth: 512,
//           compressFormat: ImageCompressFormat.jpg);
//       cropImagePath.value = cropImageFile!.path;
//       cropImageSize.value =
//           ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
//                   .toStringAsFixed(2) +
//               "Mb";

      //Compress Image
      // final dir = await Directory.systemTemp;
      // final targetPath = dir.absolute.path + "/temp.jpg";
      // var compressedImageFile = await FlutterImageCompress.compressAndGetFile(
      //     cropImagePath.value, targetPath,
      //     quality: 90);
      // compressImagePath.value = compressedImageFile!.path;
      // compressImageSize.value =
      //     ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         "Mb";
      // uploadImage(compressedImageFile);
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void uploadImage(File file) {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
    // ImageUploadProvider().
  }

  void increment() => count.value++;
}
