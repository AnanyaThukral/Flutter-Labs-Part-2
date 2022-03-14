import 'package:flutter/foundation.dart';

class NewAttraction {
  final String title;
  final String address;
  final String imageURL;
  final bool isFree;
  // final List<String> categories;
  final String categories;
  final String description;

  NewAttraction({
    required this.title,
    required this.address,
    required this.imageURL,
    required this.categories,
    this.isFree = true,
    required this.description,
  });
}
