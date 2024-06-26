// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconButtonBackWidget extends StatelessWidget {
  Color? color;
  IconButtonBackWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back, color: color, size: 23, weight: 900),
    );
  }
}
