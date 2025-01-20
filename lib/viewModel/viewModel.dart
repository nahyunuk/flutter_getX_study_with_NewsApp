import 'package:get/get.dart';
import '../model/newsModel.dart';
import '../repository/repository.dart';

class NewsViewModel extends GetxController {
  late final NewsArticleRepository repository;

  NewsViewModel({required this.repository});

  var news = <NewsArticle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    fetchNews('');
  }

 Future<void> fetchNews(String query) async {
    try{
      isLoading.value = true;
      final fetchedNews = await repository.getNewsArticle(query);
      news.value = fetchedNews;
      print(fetchedNews);
    } catch (e){
      Get.snackbar('Error', 'Failed to load News : $e');
    }
    finally {
      isLoading.value = false;
    }
 }
}