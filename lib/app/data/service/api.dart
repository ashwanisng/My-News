import 'package:news_app/app/data/model/articel.dart';
import 'package:http/http.dart' as http;

class FetchFromApi {
  final url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=b9e7b0d3647148fa90b4e0beff0990bf';

  Future<News?> getNews() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    }
  }

  fetchCountryNews(String country) async {
    var _url =
        "https://newsapi.org/v2/top-headlines?country=${country.toLowerCase()}&apiKey=b9e7b0d3647148fa90b4e0beff0990bf";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    }
  }

  fetchFromSelectedNewsSource(String newsSourceId) async {
    var _url =
        "https://newsapi.org/v2/top-headlines?sources=$newsSourceId&apiKey=b9e7b0d3647148fa90b4e0beff0990bf";
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    }
  }
}
