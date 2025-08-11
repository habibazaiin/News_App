import 'package:flutter/material.dart';
import 'package:my_app/models/article_model.dart';
import 'package:my_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return articles.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(childCount: articles.length, (
              context,
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: NewsTile(article: articles[index]),
              );
            }),
          )
        : SliverToBoxAdapter(
            child: Center(child: Text('Oops there was an error, Try later')),
          );
  }
}
