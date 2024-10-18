import 'dart:io';
import 'package:codelab/app/routes/app_pages.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/edit_postingan_controller.dart';
//import 'package:codelab/app/routes/app_pages.dart';

class editPostView extends StatelessWidget {
  editPostView({super.key});
  final controller = Get.put(editPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT POSTINGAN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.getImage(ImageSource.gallery);
              },
              child: Obx(() {
                // If an image has been selected, display the image; otherwise, display the add icon
                if (controller.selectedImage.value != null) {
                  return Container(
                    width: 150,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: FileImage(
                          File(controller.selectedImage.value!.path),
                        ),
                        fit: BoxFit
                            .cover, // Fit to make the image cover the container
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: 150,
                    height: 250,
                    color: Colors.grey[300],
                    child: Icon(Icons.add),
                  );
                }
              }),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Edit Foto Cover',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                onChanged: (value) {
                  controller.updateTitle(value);
                },
                decoration: InputDecoration(
                  labelText: 'Judul Bab Cerita...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                controller.updateDescription(value);
              },
              textAlign: TextAlign.left, // Align text to the left
              decoration: InputDecoration(
                labelText:
                    'Deskripsi Cerita ...', // Label remains in the top-left corner
                alignLabelWithHint:
                    true, // Ensures label stays above even if multiline
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Allows multiple lines in the field
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.NEWBAB);
              },
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 2,
                dashPattern: [4, 4], // 4 pixels on, 4 pixels off
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                child: Container(
                  width: 400,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 24), // Icon size
                      SizedBox(height: 8), // Space between icon and text
                      Text(
                        'Tambah Bab Baru', // Text below the icon
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150, // Set the desired width
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic for the save button
                      print('Simpan');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      //primary: Colors.white,
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
