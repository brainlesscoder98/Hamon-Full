
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/constants/api_constant.dart';
import '../../../core/constants/ui_colors.dart';
import '../../../core/services/api_service/api_service.dart';
import '../../../main.dart';
import '../../listing/model/classroomDetail_model.dart';
import '../../registration/model/subject_details_response.dart';
import '../model/addSubjectResponse.dart';

class AddSubjectController extends GetxController {

  RxInt selectedSubjectId = 0.obs;
  RxInt classroomId = 0.obs;
  final ApiService _apiService = ApiService();
  Rx<SubjectDetailsResponse?> subjectDetailsResponse = Rx<SubjectDetailsResponse?>(null);
  void updateSelectedSubjectId(int id) {
    selectedSubjectId.value = id;
  }
  void updateClassroomId(int id) {
    classroomId.value = id;
  }
  @override
  void onInit() {
    fetchClassroomDetails();
    super.onInit();
  }
  Future<void> fetchSubjectAddDetails(int subjectID) async {
    try {
      final subjectResponse = await _apiService.fetchSubjectDetails(subjectID);
      if (subjectResponse != null) {
        subjectDetailsResponse.value = subjectResponse;
        storage.write("subjectID",subjectDetailsResponse.value?.name??"");
        update();
      } else {
        subjectDetailsResponse.value = null;
      }
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error fetching subject details: $e');
      }
    }
  }
  Future<void> fetchClassroomDetails() async {
    try {
      final ClassroomDetailsModel? classroomDetails = await _apiService.fetchClassroomDetails();
      if (classroomDetails != null) {
        fetchSubjectAddDetails(classroomDetails.subject??0);
        // Handle the fetched classroom details here
      } else {
        throw Exception('Failed to fetch classroom details');
      }
    } catch (e) {
      // Get.snackbar("Failed!", "Error fetching classroom details: $e", backgroundColor: UIColors.pink255);
      if (kDebugMode) {
        print('Error fetching classroom details: $e');
      }
    }
  }
  Future<void> addSubject() async {
    try {
      final Map<String, dynamic> requestBody = {
        'subject': selectedSubjectId.value,
      };
      if (kDebugMode) {
        print("Classroom id:${storage.read("classroomID")}");
      }

      final dynamic response = await _apiService.patchDataFormData(
        'classrooms/${storage.read("classroomID")}',
        ApiConstant.apiKey,
        requestBody,
        AddSubjectSuccessResponse.fromJson,
      );

      if (response is AddSubjectSuccessResponse) {
        if (kDebugMode) {
          print('Added successful: ${response.toJson()}');
        }

        Get.snackbar("Success!", "Subject added successfully", backgroundColor: UIColors.green170);
            } else {
        throw Exception('Unexpected response format: $response');
      }
    }
    catch (e) {

      Get.snackbar("Failed!", "Error creating registration: $e", backgroundColor: UIColors.pink255);
      if (kDebugMode) {
        print('Error creating registration: $e');
      }
    }
  }
}