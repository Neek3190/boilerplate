import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';

class AppCircularBar extends StatelessWidget {
  const AppCircularBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height,
      width: Get.width,
      child: const CircularProgressIndicator(
        color: AppColor.themeColor,
      ),
    );
  }
}
