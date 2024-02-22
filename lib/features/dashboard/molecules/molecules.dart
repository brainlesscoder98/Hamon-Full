
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hamon/core/views/molecules/custom_space.dart';
import 'package:hamon/features/listing/classroom_listing.dart';
import 'package:hamon/features/listing/subjects_listing.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/ui_colors.dart';
import '../../../core/views/molecules/hAppCard.dart';
import '../../listing/students_listing.dart';
import '../../registration/views/registration.dart';

Widget buildListView() {
  return ListView(
    children: [
      const CustomSpace(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HAppCard(
              title: 'Students',
              icon: '',
              cardColor: UIColors.teal170,
              height: 50,
              width: Get.width,
              onTap: () {
                Get.to(() =>  StudentsListing(isRegistration: false));
              },
            ),
            const CustomSpace(height: 20,),
            HAppCard(
              title: 'Subjects',
              icon: '',
              cardColor: UIColors.blue216,
              height: 50,
              width: Get.width,
              onTap: () {
                Get.to(() =>  SubjectListing(isRegistration: false,type: '',classroomId: 0,));
              },
            ),
            const CustomSpace(height: 20,),
            HAppCard(
              title: 'Classroom',
              icon: '',
              cardColor: UIColors.pink255,
              height: 50,
              width: Get.width,
              onTap: () {
                Get.to(() =>  ClassroomListing());
              },
            ),
            const CustomSpace(height: 20,),
            HAppCard(
              title: 'Registration',
              icon: '',
              cardColor: UIColors.yellow255,
              height: 50,
              width: Get.width,
              onTap: () {
                Get.to(() =>  Registration());
              },
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildGridView() {
  return Padding(
    padding: const EdgeInsets.only(left: 8,right: 8,top: 20),
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      children: [
        HAppCard(
          title: 'Students',
          icon: AppAssets().studentIcon,
          cardColor: UIColors.teal170,
          onTap: () {
            Get.to(() =>  StudentsListing(isRegistration: false));
          },
        ),
        HAppCard(
          title: 'Subjects',
          icon: AppAssets().subjectIcon,
          cardColor: UIColors.blue216,
          onTap: () {
            Get.to(() =>  SubjectListing(isRegistration: false,type: '',classroomId: 0,));
          },
        ),
        HAppCard(
          title: 'Classroom',
          icon:AppAssets().classroomIcon,
          cardColor: UIColors.pink255,
          onTap: () {
            Get.to(() =>  ClassroomListing());
          },
        ),
        HAppCard(
          title: 'Registration',
          icon: AppAssets().registrationIcon,
          cardColor: UIColors.yellow255,
          onTap: () {
            Get.to(() =>  Registration());
          },
        ),
      ],
    ),
  );
}