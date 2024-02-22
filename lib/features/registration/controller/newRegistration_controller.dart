import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import '../../../core/constants/api_constant.dart';
import '../../../core/controller/global_controller.dart';
import '../../../core/services/api_service/api_service.dart';
import '../model/registrationAll_model.dart';
import '../model/success_model.dart'; // Import the ApiResponse model

class NewRegistrationController extends GetxController {
  var selectedStudentName = ''.obs;
  var selectedSubjectName = ''.obs;
  RxInt selectedSubjectId = 0.obs;
  RxInt selectedStudentId = 0.obs;
  final ApiService _apiService = ApiService();
  RxList<RegistrationAll> registration = <RegistrationAll>[].obs;
  void updateSelectedStudentName(String name) {
    selectedStudentName.value = name;
  }

  void updateSelectedStudentId(int id) {
    selectedStudentId.value = id;
  }

  void updateSelectedSubjectId(int id) {
    selectedSubjectId.value = id;
  }

  void updateSelectedSubjectName(String name) {
    selectedSubjectName.value = name;
  }

  @override
  void onInit() {
    fetchRegistrations();
    super.onInit();
  }
  Future<void> fetchRegistrations() async {
    try {
      GlobalController.instance.setLoading(true);
      registration.value = await _apiService.fetchData<RegistrationAll>('registration', ApiConstant.apiKey, 'registrations', (json) => RegistrationAll.fromJson(json));
    } catch (e) {
      /// Handle errors
      if (kDebugMode) {
        print('Error fetching subjects: $e');
      }
    }finally{
      GlobalController.instance.setLoading(false);
    }
  }
  Future<void> createRegistration() async {
    try {
      final Map<String, dynamic> requestBody = {
        'student': selectedStudentId.value,
        'subject': selectedSubjectId.value,
      };

      final dynamic response = await _apiService.postDataFormData(
        'registration',
        ApiConstant.apiKey,
        requestBody,
        RegistrationSuccessResponse.fromJson,
      );

      if (response is RegistrationSuccessResponse) {
        if (response.registration != null) {
          if (kDebugMode) {
            print('Registration successful: ${response.registration!.toJson()}');
          }

          Get.snackbar("Success!", "Registration successful", backgroundColor: UIColors.green170);
        } else {

          throw Exception('Registration failed: Response does not contain registration data.');
        }
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
