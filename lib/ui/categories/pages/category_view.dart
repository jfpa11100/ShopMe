import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';

class CategoryView extends StatefulWidget {
  final Category category;
  const CategoryView({super.key, required this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    Category category = widget.category;
    return Center(child: Text('Category View of $category.name'));
  }
}
