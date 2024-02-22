import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_constant.dart';
import '../../../core/views/resource/style_manager.dart';
import '../../../core/views/widgets/hAppbar.dart';

class DetailsWidget extends StatelessWidget {
  final String type;
  final String image;
  final String? studentName;
  final int? studentAge;
  final String? studentEmail;
  final String? subjectName;
  final int? subjectCredit;
  final String? subjectDescription;

  const DetailsWidget({
    required this.type,
    required this.image,
    this.studentName,
    this.studentAge,
    this.studentEmail,
    this.subjectName,
    this.subjectCredit,
    this.subjectDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget additionalWidget = Container(); // Assign a default value
    String header = "";
    String assetImage = "";
    if (type == "students") {
      header = "Student Detail";
      assetImage = "assets/png/studentIcon.png";
      additionalWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSpace(height: 10,),
          Text(
            studentName??"",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 20, color: UIColors.black),
          ),
          const CustomSpace(height: 10,),
          Text(
            "Age:${studentAge??""}",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 20, color: UIColors.black),
          ),
          const CustomSpace(height: 10,),
          Text(
            studentEmail ?? "",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 14, color: UIColors.black),
          ),
        ],
      );
    } else if (type == "subjects") {
      header = "Subject Detail";
      assetImage = "assets/png/subjectIcon.png";
      additionalWidget =  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSpace(height: 10,),
          Text(
            subjectName??"",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 20, color: UIColors.black),
          ),
          const CustomSpace(height: 10,),
          Text(
            subjectDescription ?? "",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 20, color: UIColors.black),
          ),
          const CustomSpace(height: 10,),
          Text(
            "Credit: ${subjectCredit??""}",
            textAlign: TextAlign.right,
            style: getSemiBoldStyle(fontSize: 14, color: UIColors.black),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: HAppBar.secondary(title: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,size: 25,color: UIColors.black,))),
      body: ListView(
        children: [
          Text(header,
              textAlign: TextAlign.center,
              style: getBoldStyle(fontSize: 20, color: UIColors.black)),
          const CustomSpace(height: 80,),
          Container(
            width: UIConstant.circleWidth,
            height: UIConstant.circleWidth,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: UIColors.menuIconCOlor,
              image: DecorationImage(image: AssetImage(assetImage))
            ),
          ),
          additionalWidget,
        ],
      ),
    );
  }
}
