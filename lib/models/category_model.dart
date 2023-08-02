import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String iconPath;
  final Color boxColor;

  CategoryModel({required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategory() {
    List<CategoryModel> category = [];
    category.add(CategoryModel(name: 'Salad', iconPath: 'assets/icons/plate.svg', boxColor: const Color(0xff9DCEFF)));

    category.add(CategoryModel(name: 'Cake', iconPath: 'assets/icons/pancakes.svg', boxColor: const Color(0xffEEA4CE)));

    category.add(CategoryModel(name: 'Pie', iconPath: 'assets/icons/pie.svg', boxColor: const Color(0xff9DCEFF)));

    category.add(CategoryModel(
        name: 'Smoothies', iconPath: 'assets/icons/orange-snacks.svg', boxColor: const Color(0xffEEA4CE)));
    return category;
  }
}
