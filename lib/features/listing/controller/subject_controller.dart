import 'package:get/get.dart';
import 'package:hamon/core/constants/api_constant.dart';
import '../../../core/services/api_service/api_service.dart';
import '../model/subjects_model.dart';

class SubjectsController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<Subject> subjects = <Subject>[].obs;

  @override
  void onInit() {
    fetchSubjects();
    super.onInit();
  }

  Future<void> fetchSubjects() async {
    try {
      subjects.value = await _apiService.fetchData<Subject>('subjects', ApiConstant.apiKey, 'subjects', (json) => Subject.fromJson(json));
    } catch (e) {
      /// Handle errors
      print('Error fetching subjects: $e');
    }
  }
}
