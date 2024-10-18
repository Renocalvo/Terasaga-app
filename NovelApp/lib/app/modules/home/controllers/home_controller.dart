import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  // Observable variables
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Method to get image from camera or gallery
  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          (File(selectedImagePath.value).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " MB";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
