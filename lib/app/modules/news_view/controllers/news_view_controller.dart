// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class NewsViewController extends GetxController {
  //TODO: Implement NewsViewController

  String? title;
  String? description;
  String? urlToImage;
  String? source;
  DateTime? publishedAt;
  String? url;

  @override
  void onInit() {
    super.onInit();

    var data = Get.arguments;

    title = data["title"];
    description = data["description"];
    urlToImage = data["urlToImage"];
    source = data["newsSource"];
    publishedAt = data["publishedAt"];
    url = data['url'];
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
