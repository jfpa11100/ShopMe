import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/ui/categories/pages/category_view.dart';
import 'package:myapp/ui/categories/widgets/category_item.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                // Navigate to category view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryView(category: category),
                  ),
                );
              },
              child: CategoryItem(category: category),
            ),
          );
        },
      ),
    );
  }
}
