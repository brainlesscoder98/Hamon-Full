import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/api_constant.dart';
import '../../../core/services/api_service/api_service.dart';
import '../model/students_model.dart';

class StudentsController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<Student> student = <Student>[].obs;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  Future<void> fetchStudents() async {
    try {
      student.value = await _apiService.fetchData<Student>('students', ApiConstant.apiKey, 'students', (json) => Student.fromJson(json));
    } catch (e) {
      /// Handle errors
      if (kDebugMode) {
        print('Error fetching subjects: $e');
      }
    }
  }
}
