import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/core/env/env.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
              size: 100, color: Env.colors.secondryGrey),
          Center(
            child: Text(
              "No Internet Connection!",
              style: TextStyle(fontSize: 30, color: Env.colors.primaryIndigo),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {},
            child: Text(
              "Try again",
              style: TextStyle(color: Env.colors.secondryWhite),
            ),
            color: Env.colors.primaryIndigo,
          )
        ],
      ),
    );
  }
}
