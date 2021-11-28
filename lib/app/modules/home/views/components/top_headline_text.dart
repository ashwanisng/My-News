import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';
import 'package:news_app/app/modules/home/controllers/category_controller.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';

class TopHeadLinesText extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top Headlines",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Sort: "),
              Obx(
                () => DropdownButton<String>(
                  value: controller.selectedCategory.value.isNotEmpty
                      ? controller.selectedCategory.value
                      : null,
                  key: UniqueKey(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Env.colors.primaryIndigo,
                  ),
                  items: <String>["Popular", "Newest", "Oldest"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (dynamic newVal) {
                    controller.selectedCategory.value = newVal;
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
