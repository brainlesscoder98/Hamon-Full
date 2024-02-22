import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_constant.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/features/dashboard/dashboard.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/constants/ui_colors.dart';
import '../../../core/controller/global_controller.dart';
import '../../../core/views/resource/style_manager.dart';
import '../../../core/views/widgets/hAppbar.dart';
import '../../listing/molecules/molecules.dart';
import '../controller/newRegistration_controller.dart';
import '../molecules/molecules.dart';

class Registration extends StatelessWidget {
  final NewRegistrationController registrationController = Get.put(NewRegistrationController());
  Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar.secondary(
        automaticallyImplyLeading:false,
        title: GestureDetector(
          onTap: () {
            Get.offAll(Dashboard());
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 25, color: UIColors.black),
        ),
      ),
      body:WillPopScope(
        child: Obx((){
        final isLoading = GlobalController.instance.isLoading.value;
        return isLoading?Center(child: SizedBox(height:UIConstant.appHeight*0.7,child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ))):SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Skeletonizer(
                enabled: isLoading,
                child: Text("Registration",
                    textAlign: TextAlign.center,
                    style: getBoldStyle(fontSize: 18, color: UIColors.black)),
              ),
              const CustomSpace(height: 20,),
              Obx(() {
                final isLoading = GlobalController.instance.isLoading.value;
                if (isLoading) {
                  /// Show skeleton UI while loading
                  return buildSkeleton(isLoading);
                }
                else {
                  /// Show reg list if data is available
                  return buildRegListView(registrationController.registration);
                }
              }),
              const CustomSpace(height: 20,),
              buildNewRegButton()
            ],
          ),
        );
      }),
        onWillPop: () async{
        Get.offAll(Dashboard());
        return true;
      },)


    );
  }
}
