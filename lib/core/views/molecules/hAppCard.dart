import 'package:flutter/material.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';

import '../resource/style_manager.dart';

class HAppCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color cardColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  const HAppCard({
    required this.title,
    required this.icon,
    required this.cardColor,
    required this.onTap,
    this.width,
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: UIConstant.horizontalPadding,
        width: width ?? UIConstant.appWidth*0.43,
        height: height ?? UIConstant.appHeight*0.25,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: UIConstant.borderRadiusAll
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon==''?const SizedBox():Image.asset(icon,width: 40,height: 40,),
            Text(
              title,
              textAlign: TextAlign.right,
              style: getBoldStyle(
                fontSize: 14,
                color: UIColors.black
              ),

            ),
          ],
        )
      ),
    );
  }
}
