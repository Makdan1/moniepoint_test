import 'package:flutter/foundation.dart';

class ProgressRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final String cancelTitle;

  ProgressRequest(
      {required this.title,
      required this.description,
      required this.buttonTitle,
      required this.cancelTitle});
}

class ProgressResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  ProgressResponse({
    required this.fieldOne,
    required this.fieldTwo,
    required this.confirmed,
  });
}
