import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/core/views/widgets/hAppbar.dart';
import 'package:hamon/features/listing/controller/students_controller.dart';
import 'package:hamon/features/listing/molecules/molecules.dart';
import 'package:hamon/features/registration/controller/newRegistration_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../core/controller/global_controller.dart';
import '../../core/views/resource/style_manager.dart';

class StudentsListing extends StatelessWidget {
  final StudentsController studentsController = Get.put(StudentsController());
  final bool isRegistration;
  StudentsListing({
    required this.isRegistration,
    super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewRegistrationController());
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: HAppBar.secondary(title: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,size: 25,color: UIColors.black,))),
      body: Obx((){
        final isLoading = GlobalController.instance.isLoading.value;
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Skeletonizer(
                enabled: isLoading,
                child: Text("Students",
                    textAlign: TextAlign.right,
                    style: getBoldStyle(fontSize: 18, color: UIColors.black)),
              ),
              const CustomSpace(height: 10,),
              Obx(() {
                final isLoading = GlobalController.instance.isLoading.value;
                if (isLoading) {
                  /// Show skeleton UI while loading
                  return buildSkeleton(isLoading);
                } else if (studentsController.student.isEmpty) {
                  /// Show loading indicator if classroom data is empty
                  return  Center(child: SizedBox(height:UIConstant.appHeight*0.7,child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )));
                } else {
                  /// Show classroom list if data is available
                  return buildStudentsListView(studentsController.student,isRegistration);
                }
              }),

            ],
          ),
        );
      }),
    );
  }
}
