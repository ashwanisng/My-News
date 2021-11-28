import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/modules/newsweb/controllers/newsweb_controller.dart';

import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends GetView<NewsWebController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: WebView(
                  initialUrl: controller.url,
                  onWebViewCreated: ((WebViewController webViewController) {
                    controller.completer.complete(webViewController);
                  }),
                ),
              ),
      ),
    );
  }
}
