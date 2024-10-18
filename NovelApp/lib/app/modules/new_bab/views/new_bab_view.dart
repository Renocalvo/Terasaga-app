import 'dart:io';
//import 'package:codelab/app/modules/new_postingan/views/new_postingan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/new_bab_controller.dart';
import 'package:codelab/app/routes/app_pages.dart';

class newBabView extends StatelessWidget {
  newBabView({super.key});
  final controller = Get.put(newBabController());

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
                    width: 250,
                    height: 150,
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
                    width: 250,
                    height: 150,
                    color: Colors.grey[300],
                    child: Icon(Icons.add),
                  );
                }
              }),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Tambahkan Ilustrasi',
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
              textAlign: TextAlign.left, // Teks yang diinput tetap rata kiri
              decoration: InputDecoration(
                labelText:
                    'Tulis Disini Untuk Bercerita', // Label tetap berada di pojok kiri atas
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
                      print('selsei');
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
                SizedBox(
                  width: 150, // Sama dengan lebar ElevatedButton
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.NEWPOSTINGAN);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors
                          .grey, // Mengatur warna latar belakang menjadi abu-abu
                    ),
                    child: Text(
                      'Kembali',
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
