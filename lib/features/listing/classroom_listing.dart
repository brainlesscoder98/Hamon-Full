import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/core/views/widgets/hAppbar.dart';
import 'package:hamon/features/listing/controller/classroom_controller.dart';
import 'package:hamon/features/listing/molecules/molecules.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../core/constants/ui_constant.dart';
import '../../core/controller/global_controller.dart';
import '../../core/views/resource/style_manager.dart';

class ClassroomListing extends StatelessWidget {
  final ClassroomController classroomController = Get.put(ClassroomController());
   ClassroomListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: HAppBar.secondary(title: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,size: 25,color: UIColors.black,))),
      body:Obx(() {
        final isLoading = GlobalController.instance.isLoading.value;
        return  SingleChildScrollView(
          child: Skeletonizer(
            enabled:isLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Classroom",
                    textAlign: TextAlign.right,
                    style: getBoldStyle(fontSize: 18, color: UIColors.black)),
                const CustomSpace(height: 10,),
                Obx(() {
                  final isLoading = GlobalController.instance.isLoading.value;
                  if (isLoading) {
                    /// Show skeleton UI while loading
                    return buildSkeleton(isLoading);
                  } else if (classroomController.classroom.isEmpty) {
                    /// Show loading indicator if classroom data is empty
                    return Center(child: SizedBox(height:UIConstant.appHeight*0.7,child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )));
                  } else {
                    /// Show classroom list if data is available
                    return buildClassroomListView(classroomController.classroom);
                  }
                }),
              ],
            ),
          ),
        );
      })
    );
  }
}
