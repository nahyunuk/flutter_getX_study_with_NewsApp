import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_news_app/dataSource/dataSource.dart';
import 'package:mvvm_getx_news_app/repository/repository.dart';
import '../viewModel/viewModel.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NewsViewModel viewModel = Get.put(
      NewsViewModel(repository: NewsArticleRepository(source: DataSource())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Obx(
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
              return ListTile(
                title: Text(news.title ?? 'No Title'),
              );
            },
          );
        },
      ),
    );
  }
}
