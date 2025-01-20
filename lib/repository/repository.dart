import '../model/newsModel.dart';
import '../dataSource/dataSource.dart';

class NewsArticleRepository {
  final DataSource source;

  NewsArticleRepository({required this.source});

  Future<List<NewsArticle>> getNewsArticle(String query) async {
    try {
      return await source.getNewsArticleList(query);
    } catch (e) {
      print('Failed to fetch news articles: $e');
      return [];  // 오류 발생 시 빈 리스트 반환
    }
  }
}
