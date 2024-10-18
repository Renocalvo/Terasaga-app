import 'dart:convert';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LandingPageController extends GetxController {
  var visit = 0.obs;
  var color2 = const Color(0XFF96B1FD).obs;
  var bgColor = const Color(0XFF1752FE).obs;

  List<TabItem> items = [
    const TabItem(
      icon: Icons.home,
    ),
    const TabItem(
      icon: Ionicons.logo_firebase,
      title: 'Bookmark',
    ),
    const TabItem(
      icon: Icons.settings,
      title: 'Setting',
    ),
  ];

  RxList<Map<String, String>> imgList =
      <Map<String, String>>[].obs; // Untuk menyimpan URL gambar dari API
  RxList<Map<String, String>> bookFavorite =
      <Map<String, String>>[].obs; // Untuk menyimpan data buku favorit

  @override
  void onInit() {
    super.onInit();
    fetchBooksFromApi();
  }

  Future<void> fetchBooksFromApi() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=SEARCH_TERM&key=AIzaSyC108-Z4Zkd1siJlVka7uWn2KwqXUWj4hI'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List items = jsonData['items'];

        // Cek panjang data yang didapat dari API
        print("Jumlah item dari API: ${items.length}");

        for (var item in items) {
          final volumeInfo = item['volumeInfo'];
          imgList.add({
            'title': volumeInfo['title'] ?? 'No Title',
            'author': (volumeInfo['authors'] != null &&
                    volumeInfo['authors'].isNotEmpty)
                ? volumeInfo['authors'].join(', ')
                : 'Unknown Author',
            'image': volumeInfo['imageLinks']?['thumbnail'] ?? '',
            'previewlink': volumeInfo['previewLink'] ?? '',
          });

          bookFavorite.add({
            'title': volumeInfo['title'] ?? 'No Title',
            'author': (volumeInfo['authors'] != null &&
                    volumeInfo['authors'].isNotEmpty)
                ? volumeInfo['authors'].join(', ')
                : 'Unknown Author',
            'description': volumeInfo['description'] ?? 'No Description',
            'image': volumeInfo['imageLinks']?['thumbnail'] ?? '',
          });
        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  WebViewController webViewController(String uri) {
    if (!uri.startsWith('https://')) {
      uri = uri.replaceFirst('http://', 'https://');
    }
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(uri));
  }
}
