// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';
import 'package:news_app/app/modules/home/controllers/newssource_controller.dart';
import 'package:news_app/app/utils/new_source_name.dart';

class NewsSourceBottomSheet extends GetView<NewsSourceController> {
  NewsSourceName newsSourceName = NewsSourceName();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose your location",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: Env.colors.secondryGrey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsSourceName.newsSources.length,
                      itemBuilder: (context, index) {
                        var data = newsSourceName.newsSources[index];
                        return ListTile(
                          title: Text(
                            data['name'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Obx(
                            () => IconButton(
                              onPressed: () {
                                controller.isChecked[index] =
                                    !controller.isChecked[index];
                              },
                              icon: controller.isChecked[index]
                                  ? Icon(
                                      Icons.check_box,
                                      color: Theme.of(context).iconTheme.color,
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Env.colors.primaryBlue,
                    onPressed: () {
                      controller.selectedNewsSourceNews();
                      Get.back();
                    },
                    child: const Text(
                      "Apply Filter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
