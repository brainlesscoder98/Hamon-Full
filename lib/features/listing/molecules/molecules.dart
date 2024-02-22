
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/features/details/details.dart';
import 'package:hamon/features/listing/model/classroom_model.dart';
import 'package:hamon/features/listing/model/students_model.dart';
import 'package:hamon/features/seating/controller/addSubject_controller.dart';
import 'package:hamon/main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/constants/ui_colors.dart';
import '../../../core/views/molecules/hListCard.dart';
import '../../registration/controller/newRegistration_controller.dart';
import '../../seating/seating.dart';
import '../model/subjects_model.dart';

Widget buildStudentsListView(List<Student> student,bool isRegistration) {
  final NewRegistrationController newRegistrationController = Get.find();
  return SizedBox(
    height: Get.height*0.82,
    child: ListView.builder(
      itemCount: student.length, // Number of items
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HListCard(
            height: 50,
            age: student[index].age,
            type: "students",
            title:student[index].name??"",
            teacherName: student[index].email,
            icon: '',
            cardColor: UIColors.grey217,
            isRegistration: isRegistration,
            onTap: () {
              if(isRegistration == true){
                newRegistrationController.updateSelectedStudentName(student[index].name??"");
                newRegistrationController.updateSelectedStudentId(student[index].id??0);
                Get.back(result: student[index].name);
                newRegistrationController.update();
              }
              else{
                Get.to(() =>  DetailsWidget(type: 'students', image: '',studentAge: student[index].age,studentEmail: student[index].email,studentName: student[index].name,));
              }
            },
          ),
        );
      },
    ),
  );
}

/// Widget for subject list
Widget buildSubjectsListView(List<Subject> subjects,bool isRegistration,String type, int classroomId) {
  final NewRegistrationController newRegistrationController = Get.find();
  final AddSubjectController subjectController = Get.find();

  return SizedBox(
    height: Get.height * 0.82,
    child: ListView.builder(
      itemCount: subjects.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HListCard(
            height: 50,
            count: subjects[index].credits ?? 0,
            type: "subjects",
            title: subjects[index].name ?? '',
            teacherName: subjects[index].teacher,
            icon: '',
            isRegistration: isRegistration,
            cardColor: UIColors.grey209,
            onTap: () async{
              /// Update the onTap action as needed
              if(isRegistration==true){
                newRegistrationController.updateSelectedSubjectName(subjects[index].name??"");
                newRegistrationController.updateSelectedSubjectId(subjects[index].id??0);
                Get.back(result: subjects[index].name);
                newRegistrationController.update();
              }
              else{
                if(type =="add"){
                  subjectController.updateSelectedSubjectId(subjects[index].id??0);
                  subjectController.updateClassroomId(classroomId);
                  print("ClassroomID:$classroomId");
                  // storage.write("classroomID", classroomId);
                  // Call addSubject and wait for it to complete
                  await subjectController.addSubject();
                  Get.put(AddSubjectController());
                  final newAddSubjectController = Get.find<AddSubjectController>();
                  await newAddSubjectController.fetchClassroomDetails();
                  // After adding the subject, fetch classroom details

                  // Update the UI after fetching classroom details
                  subjectController.update();

                }
                else{
                  Get.to(() =>  DetailsWidget(
                    type: 'subjects',
                    image: '',
                    subjectName: subjects[index].name, // Example subject name
                    subjectDescription:  subjects[index].teacher, // Example subject description
                    subjectCredit:  subjects[index].credits ?? 0, // Example subject credit
                  ));
                }

              }
            },
          ),
        );
      },
    ),
  );
}

/// Classroom Widget
Widget buildClassroomListView(List<Classroom> classroom) {
  return SizedBox(
    height: Get.height*0.82,
    child: ListView.builder(
      itemCount: classroom.length, // Number of items
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        // Return each item
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HListCard(
            height: 50,
            count: classroom[index].size,
            type: "classroom",
            title: classroom[index].name??'',
            teacherName: classroom[index].layout??'',
            icon: '',
            isRegistration: false,
            cardColor:UIColors.grey209,
            onTap: () {
              storage.write("classroomID",  classroom[index].id);
              print(storage.read("classroomID"));
              print(classroom[index].id);
              Get.to(() =>  Seating(seatingName: classroom[index].name??'',totalSeats: classroom[index].size??0, type: classroom[index].layout??"",classRoomId: 0,));
            },
          ),
        );
      },
    ),
  );
}

/// Skeleton with shimmer for user experience
Widget buildSkeleton(bool isLoading) {
  if (isLoading) {
    /// Show skeleton UI while loading
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.builder(
        itemCount: 5, // Placeholder item count
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
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
