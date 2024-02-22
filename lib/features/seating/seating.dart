import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/features/seating/widgets/conference_seating.dart';
import '../../core/constants/ui_colors.dart';
import '../../core/views/resource/style_manager.dart';
import '../../core/views/widgets/hAppbar.dart';
import 'controller/addSubject_controller.dart';
import 'molecules/molecules.dart';
import 'widgets/classroom_seating.dart';

class Seating extends StatelessWidget {
  final int totalSeats;
  final String seatingName;
  final int classRoomId;
  final String type;

   Seating({
    required this.seatingName,
    required this.totalSeats,
    required this.type,
    required this.classRoomId,
    Key? key
  }) : super(key: key);
  final AddSubjectController subjectController = Get.put(AddSubjectController());
  @override
  Widget build(BuildContext context) {
    Get.put(AddSubjectController());
    return Scaffold(
      appBar: HAppBar.secondary(
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 25, color: UIColors.black),
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(seatingName??"",
                textAlign: TextAlign.right,
                style: getBoldStyle(fontSize: 18, color: UIColors.black)),
            const CustomSpace(height: 10,),
            BuildAddSubject(classRoomId: classRoomId),
            const CustomSpace(height: 30,),
            type=="conference"?ConferenceSeating(totalSeats: totalSeats,):ClassroomSeating(totalSeats: totalSeats)
          ],
        ),
      ),
    );
  }


}
