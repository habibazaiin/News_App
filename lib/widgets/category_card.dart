import 'package:flutter/material.dart';
import 'package:my_app/models/category_model.dart';
import 'package:my_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: categoryModel.categoryName.toLowerCase(),);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          height: 130,
          width: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(categoryModel.imgUrl),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              categoryModel.categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
