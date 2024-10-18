import 'package:codelab/app/modules/baca_page/controllers/baca_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codelab/app/modules/edit_postingan/views/edit_postingan_view.dart';
import 'package:codelab/app/routes/app_pages.dart';

class bacaView extends StatelessWidget {
  bacaView({super.key});
  final controller = Get.put(bacaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.pageTitle.value)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        actions: [
          Icon(Icons.signal_cellular_alt, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.battery_full, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960s With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus PageMaker Including Versions Of Lorem Ipsum.\n\n' +
                'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960s With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus PageMaker Including Versions Of Lorem Ipsum.\n\n' +
                'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960s With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus PageMaker Including Versions Of Lorem Ipsum.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Add your back action
              },
              icon: Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () {
                // Add your home action
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                // Add your forward action
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
