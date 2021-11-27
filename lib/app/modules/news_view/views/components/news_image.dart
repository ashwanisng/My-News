import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  String? url;

  NewsImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        url!,
        fit: BoxFit.cover,
      ),
    );
  }
}
