import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';

import '../resource/style_manager.dart';

class HListCard extends StatelessWidget {

  final int? age;
  final int? count;
  final String icon;
  final String type;
  final String title;
  final double? width;
  final double? height;
  final Color cardColor;
  final VoidCallback onTap;
  final String? teacherName;
  final bool isRegistration;
  const HListCard(
      {
      this.age,
      this.width,
      this.count,
      this.height,
      this.teacherName,
      required this.type,
      required this.icon,
      required this.onTap,
      required this.title,
      required this.cardColor,
      required this.isRegistration,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget additionalWidget;
    if (type == "students") {
      additionalWidget = Text(
        "Age:$age",
        textAlign: TextAlign.right,
        style: getSemiBoldStyle(fontSize: 14, color: UIColors.black),
      );
    } else if (type == "registration") {
      additionalWidget = Container();
    } else if (type == "classroom") {
      additionalWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            count.toString() ?? "",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 14, color: UIColors.black),
          ),
          Text(
            "Seats",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 10, color: UIColors.black),
          ),
        ],
      );
    } else {
      additionalWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            count.toString() ?? "",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 14, color: UIColors.black),
          ),
          Text(
            "Credit",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 10, color: UIColors.black),
          ),
        ],
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: UIConstant.horizontalPaddingTiles,
          padding: UIConstant.horizontalInsidePaddingTiles,
          width: width ?? UIConstant.appWidth * 0.43,
          height: height ?? UIConstant.appHeight * 0.25,
          decoration: const BoxDecoration(
              color: UIColors.grey209,
              borderRadius: UIConstant.borderRadiusAllTiles),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width*0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        textAlign: TextAlign.right,
                        style: getSemiBoldStyle(fontSize: 14, color: UIColors.black)),
                    Text(
                      teacherName??"",
                      textAlign: TextAlign.right,
                      style: getMediumStyle(fontSize: 10, color: UIColors.black),
                    ),
                  ],
                ),
              ),
              additionalWidget,
             ],
          )),
    );
  }
}
