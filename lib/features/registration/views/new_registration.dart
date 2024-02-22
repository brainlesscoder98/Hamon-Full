import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/features/listing/students_listing.dart';
import 'package:hamon/features/listing/subjects_listing.dart';
import '../../../core/constants/ui_colors.dart';
import '../../../core/views/molecules/hsimpleCard.dart';
import '../../../core/views/resource/style_manager.dart';
import '../../../core/views/widgets/hAppbar.dart';
import '../controller/newRegistration_controller.dart';
import '../molecules/molecules.dart';

class NewRegistration extends StatelessWidget {
  final NewRegistrationController controller = Get.put(NewRegistrationController());
  NewRegistration({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Obx((){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("New Registration",
                  textAlign: TextAlign.center,
                  style: getBoldStyle(fontSize: 18, color: UIColors.black)),
              const CustomSpace(height: 20,),
              HSimpleCard(title: controller.selectedStudentName.isEmpty ? "Select a student" : controller.selectedStudentName.value,onTap: (){Get.to(() => StudentsListing(isRegistration: true))?.then((value) {
                if (value != null && value is Map<String, dynamic>) {
                  controller.updateSelectedStudentName(value['name']);
                  controller.updateSelectedStudentId(value['id']);
                }
              });}),
              const CustomSpace(height: 20,),
              HSimpleCard(title: controller.selectedSubjectName.isEmpty ? "Select a subject" : controller.selectedSubjectName.value,onTap: (){Get.to(() => SubjectListing(isRegistration: true,type: '',classroomId: 0,))?.then((value) {
                if (value != null && value is Map<String, dynamic>) {
                  controller.updateSelectedSubjectName(value['name']);
                  controller.updateSelectedSubjectId(value['id']);
                }
              });}),
              const CustomSpace(height: 40,),
              buildRegButton(onTap: (){controller.createRegistration();})
            ],
          );
        })
      ),
    );
  }
}
