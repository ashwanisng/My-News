import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset(
        'assets/images/news.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
