import 'package:news_app/app/data/model/news_model.dart';
import 'package:http/http.dart' as http;

class FetchFromApi {
  final url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=f9fd98aa780c41298b2c77f27e2e718c';

  // Fetch All latest News

  Future<News?> getNews() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }

  // Fetch News by Selected Country

  Future<News?> fetchCountryNews(String country) async {
    var _url =
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=f9fd98aa780c41298b2c77f27e2e718c";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }

  // Fetch News by Selected News Source

  Future<News?> fetchFromSelectedNewsSource(String newsSourceId) async {
    var _url =
        "https://newsapi.org/v2/top-headlines?sources=$newsSourceId&apiKey=f9fd98aa780c41298b2c77f27e2e718c";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }

  // Search News by Keyword

  Future<News?> searchNews(String searchQuery) async {
    var _url =
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=f9fd98aa780c41298b2c77f27e2e718c";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }

  // Fetch News by Selected Category

  Future<News?> categoryWiseNews(String searchQuery) async {
    var _url =
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=f9fd98aa780c41298b2c77f27e2e718c";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
