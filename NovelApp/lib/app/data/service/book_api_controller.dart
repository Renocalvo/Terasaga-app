import 'package:codelab/app/data/model/book_product.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpController extends GetxController {
  static const String _baseUrl =
      'https://www.googleapis.com/books/v1/volumes?q=SEARCH_TERM&key=';
  static const String _apiKey = '';

  RxList<VolumeInfo> products = RxList<VolumeInfo>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchProduct();
    super.onInit();
  }

  Future<void> fetchProduct() async {
    try {
      isLoading.value = true;
      final response =
          await http.get(Uri.parse('${_baseUrl}top-headlines?apiKey=$_apiKey'));

      if (response.statusCode == 200) {
        final jsonData = response.body;

        print('Response data: $jsonData');
        final productResult = Bookproduct.fromJson(json.decode(jsonData));
        products.value = productResult.items
            .map((item) =>
                item.volumeInfo) // Ambil hanya volumeInfo dari setiap item
            .toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occured :$e');
    } finally {
      isLoading.value = false;
    }
  }
}
