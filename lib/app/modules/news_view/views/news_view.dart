import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/core/env/env.dart';
import 'package:news_app/app/core/env/theme_service.dart';

import 'package:news_app/app/modules/news_view/controllers/news_view_controller.dart';
import 'package:news_app/app/modules/news_view/views/components/news_image.dart';
import 'package:news_app/app/modules/newsweb/views/newsweb_view.dart';

class NewsView extends GetView<NewsViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Env.colors.primaryBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                NewsImage(
                  url: controller.urlToImage,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.title!,
                        // textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.white.withOpacity(0.4),
                        child: IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            controller.shareFun(
                              controller.url,
                              controller.title!,
                            );
                          },
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 14,
                right: 14,
                bottom: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.source!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.changeTheme();
                    },
                    icon: !ThemeService().isSaveDarkMode()
                        ? Icon(
                            Icons.wb_sunny,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : Icon(
                            Icons.nightlight_round,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                DateFormat.yMMMMEEEEd().format(controller.publishedAt!),
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Flexible(
                child: RichText(
                  text: TextSpan(
                    text: controller.description!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(() => NewsWebView(), arguments: controller.url);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "See full story",
                      style: TextStyle(
                        color: Env.colors.primaryBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Env.colors.primaryBlue,
                      size: 18,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
