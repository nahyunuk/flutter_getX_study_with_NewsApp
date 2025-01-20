import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/newsModel.dart';

class DataSource {
  final String key = 'e770157127c1499c94cf89a01917cd1b';

  Future<List<NewsArticle>> getNewsArticleList(String query) async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&q=${query}&pageSize=20&apiKey=$key'));
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var articles = data['articles'] as List;

        if (articles.isEmpty) {
          print('No articles found.');
        }

        return articles.map((article) => NewsArticle.fromJson(article)).toList();
      } else {
        throw Exception('Failed to load data. ErrorCode : ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return []; // 오류 발생 시 빈 리스트 반환
    }
  }
}
