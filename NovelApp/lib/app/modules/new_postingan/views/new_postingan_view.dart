import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/new_postingan_controllers.dart';
import 'package:codelab/app/routes/app_pages.dart';

class newPostView extends StatelessWidget {
  newPostView({super.key});
  final controller = Get.put(newPostingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.getImage(ImageSource.gallery);
              },
              child: Obx(() {
                // Jika gambar sudah dipilih, tampilkan gambar, jika belum tampilkan ikon add
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
                            .cover, // Fit agar gambar sesuai ukuran container
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
                text: 'Tambah Foto Cover',
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
                  labelText: 'Tambahkan Judul Cerita...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                controller.updateDescription(value);
              },
              textAlign: TextAlign.left, // Teks yang diinput tetap rata kiri
              decoration: InputDecoration(
                labelText:
                    'Deskripsi Cerita...', // Label tetap berada di pojok kiri atas
                alignLabelWithHint:
                    true, // Memastikan label tetap di atas meski multiline
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Mengatur agar field dapat menerima beberapa baris
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150, // Tentukan lebar yang diinginkan
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic for the next button
                      Get.toNamed(Routes.NEWBAB);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      //primary: Colors.white,
                    ),
                    child: Text(
                      'Selanjutnya',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150, // Sama dengan lebar ElevatedButton
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.NEWBAB);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors
                          .grey, // Mengatur warna latar belakang menjadi abu-abu
                    ),
                    child: Text(
                      'Lewati',
                      style: TextStyle(
                        color: Colors.black, // Mengatur warna teks
                      ),
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
