import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/services/api_service/api_service.dart';
import '../model/regDetails_response.dart';
import '../model/student_details_response.dart';
import '../model/subject_details_response.dart';

class RegistrationDetailsController extends GetxController {
  int registrationId = 0;
  int studentId = 0;
  int subjectId = 0;
  final ApiService _apiService = ApiService();
  Rx<RegDetailsResponse?> regDetailsResponse = Rx<RegDetailsResponse?>(null);
  Rx<StudentDetailsResponse?> studentDetailsResponse = Rx<StudentDetailsResponse?>(null);
  Rx<SubjectDetailsResponse?> subjectDetailsResponse = Rx<SubjectDetailsResponse?>(null);

  @override
  void onInit() {
    // Fetch the registration ID from arguments
    registrationId = Get.arguments['registrationId'] ?? 0;

    fetchRegistrationDetails(); // Initiating the sequence of fetching data
    super.onInit();
  }

  Future<void> fetchRegistrationDetails() async {
    try {
      final regResponse = await _apiService.fetchRegistrationDetails(registrationId);
      if (regResponse != null) {
        regDetailsResponse.value = regResponse;
        studentId = regResponse.student ?? 0; // Extract studentId
        subjectId = regResponse.subject ?? 0; // Extract subjectId
        await fetchStudentDetails(); // Call fetchStudentDetails after obtaining studentId
        await fetchSubjectDetails(); // Call fetchSubjectDetails after obtaining subjectId
      } else {
        regDetailsResponse.value = null;
      }
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error fetching registration details: $e');
      }
    }
  }

  Future<void> fetchStudentDetails() async {
    try {
      final studentResponse = await _apiService.fetchStudentDetails(studentId);
      if (studentResponse != null) {
        studentDetailsResponse.value = studentResponse;
      } else {
        studentDetailsResponse.value = null;
      }
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error fetching student details: $e');
      }
    }
  }

  Future<void> fetchSubjectDetails() async {
    try {
      final subjectResponse = await _apiService.fetchSubjectDetails(subjectId);
      if (subjectResponse != null) {
        subjectDetailsResponse.value = subjectResponse;
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


  Future<void> deleteRegistration() async {
    try {
      await _apiService.deleteData(registrationId);
      // Handle successful deletion
    } catch (e) {
      // Handle error
      print('Error deleting registration: $e');
    }
  }
}
