import 'package:flutter/material.dart';
import 'package:lawfirm_management_system/core/themes/color_manager.dart';

class CustomAppbar extends StatelessWidget {
  final bool isCenter;
  final Widget content;
  const CustomAppbar({super.key, this.isCenter = false, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      color: ColorManager.primary,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: isCenter ? .center : .start,
        children: [content],
      ),
    );
  }
}
