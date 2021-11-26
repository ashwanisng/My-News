import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';

import 'package:news_app/app/modules/news_view/controllers/news_view_controller.dart';

class NewsView extends GetView<NewsViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.secondryWhite,
      appBar: AppBar(
        backgroundColor: Env.colors.primaryBlue,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              'assets/images/news.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
