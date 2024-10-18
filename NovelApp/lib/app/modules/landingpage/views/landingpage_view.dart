import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:codelab/app/modules/landingpage/controllers/landingpage_controller.dart';
import 'package:codelab/app/modules/landingpage/views/landingpage_web_view.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:codelab/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingpageView extends StatelessWidget {
  const LandingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize LandingPageController
    final LandingPageController controller = Get.put(LandingPageController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(31, 77, 77, 77),
        elevation: 10,
        title: Container(
          width: 100,
          child: Image.asset('assets/logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/reno.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Selamat',
                    style: GoogleFonts.caveatBrush(
                        fontSize: 30, color: Colors.blue),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Datang,',
                    style: GoogleFonts.caveatBrush(
                        fontSize: 30, color: Colors.green),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Pembaca Terasaga! Temukan cerita-cerita menarik yang siap membawa Anda ke dunia baru dan nikmati petualangan membaca tanpa batas.',
                style: GoogleFonts.caveatBrush(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 3,
                        blurRadius: 15,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter text',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 123, 191, 247),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.navigation_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Baru Nih!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            // Carousel Slider for images
            Obx(() {
              if (controller.imgList.isEmpty) {
                return CircularProgressIndicator(); // Show loading indicator if data is not ready
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 1,
                  initialPage: 0,
                  viewportFraction: 0.35,
                  enableInfiniteScroll: true,
                ),
                items: controller.imgList.asMap().entries.map((entry) {
                  int index = entry.key; // Access index
                  Map<String, String> book = entry.value; // Access book data

                  return GestureDetector(
                    onTap: () {
                      String previewLink = book['previewlink'] ?? '';
                      if (previewLink.isNotEmpty) {
                        // Navigasi ke WebView menggunakan previewLink
                        Get.to(
                            () => LandingpageWebView(previewLink: previewLink));
                      } else {
                        Get.snackbar("Error", "Preview link tidak tersedia");
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      width: 300,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Stack(
                          children: [
                            Image.network(
                              book['image'] ?? '',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox.shrink(),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(230, 0, 0, 0),
                                      Color.fromARGB(150, 0, 0, 0),
                                      Color.fromARGB(0, 255, 255, 255),
                                    ],
                                    stops: [0.0, 0.13, 0.39],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 7,
                              left: 5,
                              right: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book['title'] ?? 'No Title',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'by ${book['author'] ?? 'Unknown Author'}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cerita Terpopuler',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Obx(() {
              if (controller.bookFavorite.isEmpty) {
                return CircularProgressIndicator(); // Show loading indicator if data is not ready
              }
              return SizedBox(
                height: 400, // Adjust height as needed
                child: ListView.builder(
                  itemCount: controller.bookFavorite.length,
                  itemBuilder: (context, index) {
                    final book = controller.bookFavorite[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.BACA); // Navigate to reading page
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Book Image (on the left)
                            Container(
                              width: 75,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(book['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 10), // Space between image and details
                            // Book Details (Title, Author, Description)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Book Title
                                  Text(
                                    book['title']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  // Book Author
                                  Text(
                                    'by ${book['author']}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Book Description
                                  Text(
                                    book['description']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomBarInspiredOutside(
          items: controller.items,
          backgroundColor: controller.bgColor.value,
          color: controller.color2.value,
          colorSelected: Colors.white,
          indexSelected: controller.visit.value,
          onTap: (int index) {
            controller.visit.value = index;
          },
          top: -28,
          animated: false,
          itemStyle: ItemStyle.circle,
          chipStyle: const ChipStyle(
            notchSmoothness: NotchSmoothness.sharpEdge,
          ),
        ),
      ),
    );
  }
}
