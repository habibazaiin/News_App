import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/article_model.dart';
import 'package:my_app/services/news_service.dart';
import 'package:my_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Oops there was an error, Try later')),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
    // return isLoading
    //     ? SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(child: CircularProgressIndicator()),
    //       )
    //     : NewsListView(articles: articles);
  }
}
