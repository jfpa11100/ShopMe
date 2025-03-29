import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';

class CategoryView extends StatefulWidget {
  final Category category;
  const CategoryView({super.key, required this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late final Category category;
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Category View of $category.name'));
  }
}
