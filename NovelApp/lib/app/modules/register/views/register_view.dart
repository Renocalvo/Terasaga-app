import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../../../routes/app_pages.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Ionicons.arrow_back),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Buat Akun Baru',
                        style: GoogleFonts.redressed(
                            fontSize: 35,
                            color: Color.fromARGB(255, 0, 0, 255)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      25, 0, 0, 0), // Set your desired margin here
                  child: Row(
                    children: [
                      Text('Sudah Punya Akun?'),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes
                              .LOGIN); // Add your onPressed functionality here
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Nama', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email Address', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: 'Password', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.black]),
                      borderRadius: BorderRadius.circular(25)),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.LANDINGPAGE);
                    },
                    child: Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
