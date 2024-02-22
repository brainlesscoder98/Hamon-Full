import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/api_constant.dart';
import 'package:hamon/features/listing/model/classroomDetail_model.dart';
import '../../../core/services/api_service/api_service.dart';
import '../model/classroom_model.dart';

class ClassroomController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<Classroom> classroom = <Classroom>[].obs;

  @override
  void onInit() {
    fetchClassroom();
    super.onInit();
  }

  Future<void> fetchClassroom() async {
    try {
      classroom.value = await _apiService.fetchData<Classroom>('classrooms', ApiConstant.apiKey, 'classrooms', (json) => Classroom.fromJson(json));
    } catch (e) {
      /// Handle errors
      if (kDebugMode) {
        print('Error fetching subjects: $e');
      }
    }
  }
  Future<ClassroomDetailsModel?> fetchClassroomDetails(int classroomId) async {
    try {
      final List<ClassroomDetailsModel> classroomDetailsList = await _apiService.fetchData<ClassroomDetailsModel>('classrooms/$classroomId', ApiConstant.apiKey, '', (json) => ClassroomDetailsModel.fromJson(json));
      if (classroomDetailsList.isNotEmpty) {
        return classroomDetailsList.first;
      } else {
        throw Exception('Classroom details not found');
      }
    } catch (e) {
      /// Handle errors
      if (kDebugMode) {
        print('Error fetching classroom details: $e');
      }
      return null;
    }
  }
}
