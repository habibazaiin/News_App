import 'package:flutter/material.dart';
import 'package:my_app/widgets/category_list_view.dart';
import 'package:my_app/widgets/news_list_view_builder.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black, fontSize: 22)),
            Text('Cloud', style: TextStyle(color: Colors.orange, fontSize: 22)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}

