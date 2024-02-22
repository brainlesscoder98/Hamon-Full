import 'package:flutter/material.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';import '../resource/style_manager.dart';

class HDetailCard extends StatelessWidget {
  final String header;
  final String title;
  final String footer;
  final String? age;
  final String? credit;
  final bool enabled;
  const HDetailCard(
      {
        required this.header,
        required this.title,
        required this.footer,
        required this.enabled,
        this.age,
        this.credit,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Container(
          margin: UIConstant.horizontalPaddingTiles,
          padding: UIConstant.horizontalInsidePaddingTiles,
          width: UIConstant.appWidth,
          height: 90,
          decoration: const BoxDecoration(
              color: UIColors.grey209,
              borderRadius: UIConstant.borderRadiusAllTiles),
          child: SizedBox(
            width: UIConstant.appWidth*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(header,
                    textAlign: TextAlign.right,
                    style: getRegularStyle(fontSize: 16, color: UIColors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                        textAlign: TextAlign.right,
                        style: getRegularStyle(fontSize: 13, color: UIColors.black)),
                    Text(header=="Student details"?"Age: $age":"Credit: $credit",
                        textAlign: TextAlign.right,
                        style: getRegularStyle(fontSize: 13, color: UIColors.black)),
                  ],
                ),
                Text(footer,
                    textAlign: TextAlign.right,
                    style: getRegularStyle(fontSize: 13, color: UIColors.black)),
              ],
            ),
          )),
    );
  }
}
