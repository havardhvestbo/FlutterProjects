import 'package:flutter/material.dart';

/// Represents a category with an ID, title, and color.
class Category {
  /// Creates a new category. [color] defaults to orange if not specified.
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  /// Unique identifier for the category.
  final String id;

  /// Display name of the category.
  final String title;

  /// Color associated with the category.
  final Color color;
}
