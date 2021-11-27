import 'dart:convert';

import 'package:news_app/app/data/model/articel.dart';
import 'package:http/http.dart' as http;

class FetchFromApi {
  // List<News> articles = [];

  final url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=b9e7b0d3647148fa90b4e0beff0990bf';

  Future<News?> getNews() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    }

    // if (jsonData['status'] == 'ok') {
    //   jsonData['articles'].forEach(
    //     (element) {
    //       if (element['urlToImage'] != null && element['description'] != null) {
    //         Articles article = Articles(
    //           title: element['title'],
    //           author: element['author'],
    //           description: element['description'],
    //           url: element['url'],
    //           urlToImage: element['urlToImage'],
    //           content: element['content'],
    //         );
    //         articles.add(article); //adding the article to the list
    //       }
    //     },
    //   );
    // } else {
    //   print('error');
    // }
  }
}
