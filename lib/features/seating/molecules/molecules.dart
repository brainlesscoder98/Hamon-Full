import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/constants/ui_constant.dart';
import 'package:hamon/features/listing/subjects_listing.dart';
import '../../../core/views/resource/style_manager.dart';
import '../../../main.dart';

class BuildAddSubject extends StatelessWidget {
  final int classRoomId;
  // final String subjectName;
  const BuildAddSubject({required this.classRoomId,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: UIConstant.appWidth,
        margin: UIConstant.horizontalInsidePaddingTiles,
        padding: UIConstant.horizontalInsidePaddingTiles,
        height: 80,
        decoration: const BoxDecoration(
            borderRadius: UIConstant.borderRadiusAll, color: UIColors.grey217),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(storage.read("subjectID") ?? "Add Subject",
                  textAlign: TextAlign.right,
                  style: getBoldStyle(fontSize: 16, color: UIColors.black)),
              GestureDetector(
                onTap: (){
                  Get.to(SubjectListing(isRegistration: false,type: 'add',classroomId: classRoomId,));
                },
                child: Container(
                    width: UIConstant.appWidth * 0.3,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: UIConstant.borderRadiusAll,
                        color: UIColors.greenPrimary.withOpacity(0.2)),
                    child: Center(
                      child: Text(storage.read("subjectID")==""?"Add":"Update",
                          textAlign: TextAlign.right,
                          style: getBoldStyle(
                              fontSize: 16, color: UIColors.green15)),
                    )),
              )
            ]));
  }
}
Widget buildSeats(int seatCount,int totalSeats,String assetIcon) {
  return SizedBox(
    height: (totalSeats / 2 * 40) + 20,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(seatCount, (index) {
        return Container(
          margin:UIConstant.verticalPadding5,
          width: 25.0,
          height: 25.0,
          child:  Center(
            child: Image.asset(assetIcon,width: 25,height: 25,)
          ),
        );
      }),
    ),
  );
}