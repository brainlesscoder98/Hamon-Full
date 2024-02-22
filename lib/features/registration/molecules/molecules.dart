import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/features/registration/model/registrationAll_model.dart';
import 'package:hamon/features/registration/views/new_registration.dart';
import 'package:hamon/features/registration/views/registration_detail.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/views/molecules/hsimpleCard.dart';
import '../../../core/views/resource/style_manager.dart';

Widget buildNewRegButton(){
  return GestureDetector(
    onTap: (){
      Get.to(() => NewRegistration());
    },
    child: Container(
      width: UIConstant.appWidth*0.6,
      height: 50,
      decoration:const BoxDecoration(
        color: UIColors.blue0,
        borderRadius: UIConstant.borderRadiusAll,
      ),
      child: Center(child: Text("New Registration",style: getBoldStyle(fontSize: 18, color: UIColors.blue01),)),
    ),
  );
}
Widget buildRegButton({required VoidCallback onTap}){
  return GestureDetector(
    onTap:onTap,
    child: Container(
      width: UIConstant.appWidth*0.4,
      height: 50,
      decoration:const BoxDecoration(
        color: UIColors.green15,
        borderRadius: UIConstant.borderRadiusAll,
      ),
      child: Center(child: Text("Register",style: getBoldStyle(fontSize: 18, color: UIColors.white),)),
    ),
  );
}
Widget buildRegListView(List<RegistrationAll> registration) {
  if (registration.isEmpty) {
    return Center(
      child: SizedBox(
        height: UIConstant.appHeight*0.7,
        child: Center(
          child: Text(
            'No Data',
            style: getSemiBoldStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }else{
    return Container(
      height: Get.height*0.7,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: registration.length, // Number of items
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          // Return each item
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            child: HSimpleCard(
              title:'Registration Id: #${registration[index].id}',
              onTap: () {
                Get.to(
                      () => RegDetails(),
                  arguments: {'registrationId': registration[index].id},
                );
              },
            ),
          );
        },
      ),
    );
  }

}


Widget buildSkeletonDetails(bool isLoading) {
  if (isLoading) {
    /// Show skeleton UI while loading
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.builder(
        itemCount: 2, // Placeholder item count
        shrinkWrap: true,
        itemBuilder: (context, index) {
          /// Return a shimmer effect for the placeholder item
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white, // Placeholder item color
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 16.0),
            ),
          );
        },
      ),
    );
  } else {
    /// Return an empty container if not loading
    return Container();
  }
}
Widget buildDeleteRegButton({required VoidCallback onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: UIConstant.appWidth*0.6,
      height: 50,
      decoration:const BoxDecoration(
        color: Colors.red,
        borderRadius: UIConstant.borderRadiusAll,
      ),
      child: Center(child: Text("Delete Registration",style: getBoldStyle(fontSize: 18, color: UIColors.white),)),
    ),
  );
}
void showDeleteConfirmation({required VoidCallback onTap}) {
  Get.defaultDialog(
    title: 'Delete',
    titleStyle: getBoldStyle(color: UIColors.black,fontSize: 16),
    middleText: 'Do you want to delete',
    middleTextStyle:getMediumStyle(color: UIColors.black,fontSize: 13),
    content: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Do you want to delete",style: getMediumStyle(color: UIColors.black,fontSize: 13),),
          const CustomSpace(height: 10,),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: Text('No',style: getMediumStyle(color: Colors.blue,fontSize: 13),),
              ),
              TextButton(
                onPressed:onTap,
                child: Text(
                  'Yes',
                  style: getMediumStyle(color: Colors.blue,fontSize: 13), // Set text color to red
                ),
              ),
            ],
          ),


        ],
      ),
    ),
    actions: [

    ],
  );
}