import 'package:flutter/material.dart';

/// Dog class
class Dog {
  /// Dog name
  final String name;

  /// Dog location
  final String location;

  /// Dog description
  final String description;

  /// Dog image
  final String image;

  /// Dog rating
  int rating = 10;

  /// Dog constructor
  Dog({
    @required this.name,
    this.location,
    this.description,
    this.image,
  });
}
