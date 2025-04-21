import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid().v4();

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.id, required this.title, this.color = Colors.orange});
}
