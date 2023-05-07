import 'package:flutter/material.dart';
// this class is for define the phone screen sizes
class Responsive{
  static width(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }
  static height(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }
}