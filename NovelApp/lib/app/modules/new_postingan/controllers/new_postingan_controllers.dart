import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class newPostingController extends GetxController {
  var storyTitle = ''.obs;
  var storyDescription = ''.obs;

  var selectedImage =
      Rxn<XFile>(); // Rxn<XFile> digunakan agar bisa null di awal

  final ImagePicker _picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImage.value = pickedFile;
      Get.snackbar('Success', 'Upload success',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white); // Simpan gambar yang dipilih
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void updateTitle(String title) {
    storyTitle.value = title;
  }

  void updateDescription(String description) {
    storyDescription.value = description;
  }
}