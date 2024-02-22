import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/core/views/molecules/hdetailCard.dart';
import 'package:hamon/features/registration/molecules/molecules.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/controller/global_controller.dart';
import '../../../core/views/resource/style_manager.dart';
import '../../../core/views/widgets/hAppbar.dart';
import '../controller/registration_details_controller.dart'; // Import the controller

class RegDetails extends StatelessWidget {
  final RegistrationDetailsController controller = Get.put(RegistrationDetailsController());
  RegDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: HAppBar.secondary(
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 25, color: UIColors.black),
        ),
      ),
      body: Obx(() {
        final isLoading = GlobalController.instance.isLoading.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: UIConstant.appHeight*0.7,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Skeletonizer(
                    enabled: isLoading,
                    child: Text(
                      "Registration",
                      textAlign: TextAlign.center,
                      style: getBoldStyle(fontSize: 18, color: UIColors.black),
                    ),
                  ),
                  const CustomSpace(height: 30,),
                  // Display student details
                  Obx((){
                    return  HDetailCard(
                      enabled: isLoading,
                      header: "Student details",
                      title: controller.studentDetailsResponse.value?.name ?? "", // Access studentName from the controller
                      footer:  controller.studentDetailsResponse.value?.email ?? "",
                      age: controller.studentDetailsResponse.value?.age.toString() ?? "", // Access age from the controller
                    );
                  }),

                  const CustomSpace(height: 20,),
                  // Display subject details
                  Obx(() {
                    return HDetailCard(
                      enabled: isLoading,
                      header: "Subject details",
                      title: controller.subjectDetailsResponse.value?.name ?? "", // Access subjectName from the controller
                      footer: controller.subjectDetailsResponse.value?.teacher ?? "",
                      credit: controller.subjectDetailsResponse.value?.credits.toString(), // Access credit from the controller
                    );
                  })
                ],
              ),
            ),
            const CustomSpace(height: 20,),
            buildDeleteRegButton(onTap: (){
              showDeleteConfirmation(onTap: (){controller.deleteRegistration();});
              // ;
            })
          ],
        );
      }),
    );
  }
}
