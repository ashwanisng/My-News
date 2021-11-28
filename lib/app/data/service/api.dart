import 'package:news_app/app/data/model/news_model.dart';
import 'package:http/http.dart' as http;

class FetchFromApi {
  final url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=d8e1938600e940e69b3ad0f789670232';

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
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=d8e1938600e940e69b3ad0f789670232";
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
        "https://newsapi.org/v2/top-headlines?sources=$newsSourceId&apiKey=d8e1938600e940e69b3ad0f789670232";
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
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=d8e1938600e940e69b3ad0f789670232";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }

  // Fetch News by Selected Category

  Future<News?> categoryWiseNews(String? category) async {
    var _url =
        "https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=d8e1938600e940e69b3ad0f789670232";

    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
