import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codelab/app/routes/app_pages.dart'; // Import your routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'My Flutter App',
      initialRoute: AppPages
          .INITIAL, // This should point to the initial route, e.g., '/home'
      getPages: AppPages.routes, // Load the routes
    );
  }
}
