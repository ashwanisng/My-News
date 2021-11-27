import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';

import 'package:news_app/app/modules/news_view/controllers/news_view_controller.dart';
import 'package:news_app/app/modules/news_view/views/components/news_image.dart';

class NewsView extends GetView<NewsViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.secondryWhite,
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
            NewsImage(
              url: controller.urlToImage,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 14,
                right: 14,
                bottom: 4,
              ),
              child: Text(
                controller.source!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                controller.publishedAt.toString(),
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
              child: Text(
                controller.description!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
