// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebController extends GetxController {
  //TODO: Implement WebController

  final Completer<WebViewController> completer = Completer<WebViewController>();

  String? url = '';
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();

    try {
      isLoading = true;
      dynamic data = Get.arguments;
      url = data.toString();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
