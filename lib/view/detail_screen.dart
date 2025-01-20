import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../dataSource/dataSource.dart';
import '../repository/repository.dart';
import '../viewModel/viewModel.dart';
class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.index});

  final int index;
  final NewsViewModel viewModel = Get.put(
      NewsViewModel(repository: NewsArticleRepository(source: DataSource())));


  @override
  Widget _showImage(context, image) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Image.network(
        image,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          // 로드 실패 시 대체 이미지 표시
          return Image.asset(
            'assets/images/placeholder.png', // 대체 이미지 경로
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    final news = viewModel.news[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _showImage(context, news.urlToImage),
            Text(news.content!,softWrap: true,style: TextStyle(fontSize: 16,),),
          ],
        ),
      ),
    );
  }
}
