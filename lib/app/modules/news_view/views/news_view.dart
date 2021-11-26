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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NewsImage(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 14,
              right: 14,
              bottom: 4,
            ),
            child: Text(
              "Heading",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "22 Sep, 2020 at 4:55pm",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Text(
              "India vs New Zealand 1st Test, Day 2 Highlights: New Zealand made a strong reply to India’s first innings total of 345 all out, reaching 129 for no loss at stumps on the second day of the opening Test here on Friday. Will Young and Tom Latham were batting on 75 and 50 respectively at close of play on Day 2. New Zealand still trail the hosts by 216 runs. India started the day on 258 for four.",
              style: TextStyle(
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
    );
  }
}
