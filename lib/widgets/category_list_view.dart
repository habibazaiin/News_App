import 'package:flutter/material.dart';
import 'package:my_app/models/category_model.dart';
import 'package:my_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  final List<CategoryModel> categoreis = const [
    CategoryModel(categoryName: 'Business', imgUrl: 'assets/business.avif'),
    CategoryModel(
      categoryName: 'Entertainment',
      imgUrl: 'assets/entertaiment.avif',
    ),
    CategoryModel(categoryName: 'General', imgUrl: 'assets/health.avif'),
    CategoryModel(categoryName: 'Health', imgUrl: 'assets/health.avif'),
    CategoryModel(categoryName: 'Science', imgUrl: 'assets/science.avif'),
    CategoryModel(categoryName: 'Sports', imgUrl: 'assets/sports.avif'),
    CategoryModel(categoryName: 'Technology', imgUrl: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoreis.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: categoreis[index]);
        },
      ),
    );
  }
}
