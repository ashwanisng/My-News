import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';
import 'package:news_app/app/modules/home/controllers/country_controller.dart';
import 'package:news_app/app/utils/country_name.dart';

class CountryBottomSheet extends GetView<CountryController> {
  @override
  Widget build(BuildContext context) {
    CountryName countryName = CountryName();
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Env.colors.secondryWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Choose your location",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
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
                      itemCount: countryName.countryList.length,
                      itemBuilder: (context, index) {
                        var data = countryName.countryList[index];
                        return Obx(
                          () => ListTile(
                            title: Text(
                              data['name'].toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                controller.isChecked.value == true
                                    ? controller.isChecked.value = false
                                    : controller.isChecked.value = true;

                                controller.countryCode =
                                    data['code'].toString();
                              },
                              icon: controller.isChecked.value == true
                                  ? Icon(
                                      Icons.radio_button_checked,
                                      color: Env.colors.primaryIndigo,
                                    )
                                  : Icon(
                                      Icons.radio_button_off_rounded,
                                      color: Env.colors.primaryIndigo,
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
                      // controller.selectedCountryNews(data['code'].toString());
                      controller.selectedCountryNews();
                      Get.back();
                    },
                    child: const Text(
                      "Apply",
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
