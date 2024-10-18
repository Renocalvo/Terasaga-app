import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:codelab/app/modules/landingpage/controllers/landingpage_controller.dart';

class LandingpageWebView extends GetView<LandingPageController> {
  final String previewLink;
  const LandingpageWebView({super.key, required this.previewLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body: WebViewWidget(
          controller:
              controller.webViewController(previewLink) //,  Uue brand.website
          ),
    );
  }
}
