// ignore_for_file: unnecessary_overrides

import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:news_app/app/core/env/theme_service.dart';

class NewsViewController extends GetxController {
  //TODO: Implement NewsViewController

  String? title;
  String? description;
  String? urlToImage;
  String? source;
  DateTime? publishedAt;
  String? url;
  String? content;
  var isDark = false.obs;

  Future<void> shareFun(dynamic link, String title) async {
    await FlutterShare.share(
      title: 'Share News',
      text: title,
      linkUrl: link,
      chooserTitle: 'Everywhere',
    );
  }

  void changeTheme() {
    try {
      ThemeService().changeThemeMode();
      isDark.value = ThemeService().isDark;
    } catch (e) {
      print(e);
    } finally {
      isDark.value = true;
    }
  }

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
    content = data['content'];
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
