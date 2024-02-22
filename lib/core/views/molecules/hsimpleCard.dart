import 'package:flutter/material.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';import '../resource/style_manager.dart';

class HSimpleCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const HSimpleCard(
      {required this.title,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: UIConstant.horizontalPaddingTiles,
          padding: UIConstant.horizontalInsidePaddingTiles,
          width: UIConstant.appWidth,
          height: 50,
          decoration: const BoxDecoration(
              color: UIColors.grey209,
              borderRadius: UIConstant.borderRadiusAllTiles),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  textAlign: TextAlign.right,
                  style: getRegularStyle(fontSize: 14, color: UIColors.black)),
              const Icon(Icons.arrow_forward_ios_rounded,color: UIColors.black,size: 20,)
             ],
          )),
    );
  }
}
