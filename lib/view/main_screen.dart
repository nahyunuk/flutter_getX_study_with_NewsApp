import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_news_app/dataSource/dataSource.dart';
import 'package:mvvm_getx_news_app/repository/repository.dart';
import 'package:mvvm_getx_news_app/view/detail_screen.dart';
import '../viewModel/viewModel.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NewsViewModel viewModel = Get.put(
      NewsViewModel(repository: NewsArticleRepository(source: DataSource())));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05, horizontal: size.width * 0.1),
            child: SearchBar(
              leading: Icon(Icons.search),
              onSubmitted: (value) {
                viewModel.fetchNews(value);
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.8,
            child: Obx(
              () {
                if (viewModel.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: viewModel.news.length,
                  itemBuilder: (context, index) {
                    final news = viewModel.news[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(()=>DetailScreen(index: index));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(news.title ?? 'No Title'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
