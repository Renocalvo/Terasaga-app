import 'package:codelab/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codelab/app/modules/edit_postingan/views/edit_postingan_view.dart';
import 'package:codelab/app/routes/app_pages.dart';

class profileView extends StatelessWidget {
  profileView({super.key});
  final controller = Get.put(profileController());

  final List<String> postingan = [
    "Menemukanmu Cinderellaku",
    "Melepasmu Dengan Senyumanku",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Profile Section (Top)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF3451FF),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.5), // Warna bayangan dengan opasitas 20%
                  spreadRadius: 1, // Seberapa jauh bayangan menyebar
                  blurRadius: 4, // Seberapa blur bayangan tersebut
                  offset: Offset(0, 6), // Posisi bayangan (x: 0, y: 4) ke bawah
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/reno.jpg'), // Your profile picture path
                ),
                SizedBox(width: 10),
                Text(
                  'Reno Calvo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Post Section
          Text(
            'POSTINGAN SAYA',
            style: TextStyle(
              fontSize: 20, // Font size for section title
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
          SizedBox(height: 10),

          // Postingan Saya Section
          Expanded(
            child: postingan.isNotEmpty
                ? ListView.builder(
                    itemCount: postingan.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.article,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  postingan[index], // Judul postingan
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  Get.to(() => editPostView());
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Belum ada postingan", // Teks yang ditampilkan jika tidak ada postingan
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
          ),

          Align(
            alignment: Alignment
                .topCenter, // Mengatur posisi tombol di pojok kanan bawah
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Memberikan sedikit padding
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.NEWPOSTINGAN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  padding: EdgeInsets.all(5),
                  shape: CircleBorder(),
                  elevation: 5,
                ),
                child: Icon(Icons.add),
              ),
            ),
          ),
          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
