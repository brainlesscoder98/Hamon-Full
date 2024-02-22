import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hamon/features/registration/controller/newRegistration_controller.dart';
import 'package:hamon/features/registration/views/registration.dart';
import 'package:hamon/main.dart';
import 'package:http/http.dart' as http;
import '../../../features/listing/model/classroomDetail_model.dart';
import '../../../features/registration/model/delete_response.dart';
import '../../../features/registration/model/regDetails_response.dart';
import '../../../features/registration/model/student_details_response.dart';
import '../../../features/registration/model/subject_details_response.dart';
import '../../constants/api_constant.dart';
import '../../constants/ui_colors.dart';
import '../../controller/global_controller.dart';

class ApiService {
    /// http.get method
  Future<List<T>> fetchData<T>(
      String endpoint,
      String apiKey,
      String nestedKeyPath,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    final apiUrl = '${ApiConstant.baseUrl}$endpoint?api_key=$apiKey';
    if (kDebugMode) {
      print('API URL: $apiUrl');
    }

    // Access the isLoading variable from the global controller
    // GlobalController.instance.setLoading(true);

    try {
      final response = await http.get(Uri.parse(apiUrl));

      // Print the response data regardless of the response status code
      if (kDebugMode) {
        print('Response Data: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> jsonData = _traverseNestedKeys(responseData, nestedKeyPath.split('.'));
        // GlobalController.instance.setLoading(false);
        return jsonData.map((json) => fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on Exception {
      // Catch any exceptions, including 500 error
      return Future.error('Failed to load data');
    } finally {
      // Set loading indicator to false after the request completes (regardless of success or failure)
      // GlobalController.instance.setLoading(false);
    }
  }

  dynamic _traverseNestedKeys(Map<String, dynamic> data, List<String> keys) {
    dynamic result = data;
    for (final key in keys) {
      if (result is Map<String, dynamic>) {
        result = result[key];
      } else {
        return null;
      }
    }
    return result;
  }

  ///http.post method
  Future<T> postData<T>(
      String endpoint,
      String apiKey,
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    final apiUrl = '${ApiConstant.baseUrl}$endpoint/?api_key=$apiKey';

    if (kDebugMode) {
      print('API URL: $apiUrl');
      print('API body: $requestBody');
    }

    // Set loading indicator to true
    GlobalController.instance.setLoading(true);

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestBody), // Encode the request body to JSON
        headers: {'Content-Type': 'application/json'}, // Specify content type
      );

      if (kDebugMode) {
        print('Response Data: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return fromJson(responseData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error('Failed to load data: $e');
    } finally {
      // Set loading indicator to false
      GlobalController.instance.setLoading(false);
    }
  }
  ///http.post form-data method
  Future<T> postDataFormData<T>(
      String endpoint,
      String apiKey,
      Map<String, dynamic> formData,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    final apiUrl = '${ApiConstant.baseUrl}$endpoint/?api_key=$apiKey';

    if (kDebugMode) {
      print('API URL: $apiUrl');
    }

    GlobalController.instance.setLoading(true); // Set loading indicator to true

    try {
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add form fields to the request
      formData.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (kDebugMode) {
        print('Response Data: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        Get.put(NewRegistrationController());
        final newRegistrationController = Get.find<NewRegistrationController>();
        await newRegistrationController.fetchRegistrations();

        Get.offAll(Registration());
        return fromJson(responseData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error('Failed to load data: $e');
    } finally {
      GlobalController.instance.setLoading(false); // Set loading indicator to false
    }
  }
  Future<T> patchDataFormData<T>(
      String endpoint,
      String apiKey,
      Map<String, dynamic> formData,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    final apiUrl = '${ApiConstant.baseUrl}$endpoint?api_key=$apiKey';

    if (kDebugMode) {
      print('API URL: $apiUrl');
    }

    GlobalController.instance.setLoading(true); // Set loading indicator to true

    try {
      final request = http.MultipartRequest('PATCH', Uri.parse(apiUrl));

      // Add form fields to the request
      formData.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (kDebugMode) {
        print('Response Data: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        // Get.off(() => Registration());
        Get.back();
        return fromJson(responseData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error('Failed to load data: $e');
    } finally {
      GlobalController.instance.setLoading(false); // Set loading indicator to false
    }
  }

  Future<RegDetailsResponse?> fetchRegistrationDetails(int registrationId) async {
    final url = '${ApiConstant.baseUrl}registration/$registrationId?api_key=${ApiConstant.apiKey}';
    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await http.get(Uri.parse(url));
      GlobalController.instance.setLoading(true);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) {
          print(jsonData);
        }
        GlobalController.instance.setLoading(false);

        return RegDetailsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load registration data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching registration details: $e');
      }
      return null;
    }finally{
      GlobalController.instance.setLoading(false);
    }
  }

  // Function to fetch student details
  Future<StudentDetailsResponse?> fetchStudentDetails(int studentId) async {
    final url = '${ApiConstant.baseUrl}students/$studentId?api_key=${ApiConstant.apiKey}';
    if (kDebugMode) {
      print(url);
    }

    try {
      GlobalController.instance.setLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) {
          print(jsonData);
        }
        GlobalController.instance.setLoading(false);
        return StudentDetailsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load student data');
      }
    } catch (e) {
      print('Error fetching student details: $e');
      return null;
    } finally{
      GlobalController.instance.setLoading(false);
    }
  }
  Future<ClassroomDetailsModel?> fetchClassroomDetails() async {
    final url = '${ApiConstant.baseUrl}classrooms/${storage.read("classroomID")}?api_key=${ApiConstant.apiKey}';
    print(url);
    if (kDebugMode) {
      print(url);
    }

    try {
    //
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) {
          print(jsonData);
        }
        return ClassroomDetailsModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load classroom data');
      }
    }
    catch (e) {
      print('Error fetching classroom details: $e');
      return null;
    }
  }

  // Function to fetch subject details
  Future<SubjectDetailsResponse?> fetchSubjectDetails(int subjectId) async {
    final url = '${ApiConstant.baseUrl}subjects/$subjectId?api_key=${ApiConstant.apiKey}';
    if (kDebugMode) {
      print(url);
    }

    try {
      GlobalController.instance.setLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) {
          print(jsonData);
        }
        GlobalController.instance.setLoading(false);
        return SubjectDetailsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load subject data');
      }
    } catch (e) {
      print('Error fetching subject details: $e');
      return null;
    } finally{
      GlobalController.instance.setLoading(false);
    }
  }

  Future<DeleteResponse?> deleteData(int registrationId) async {
    final url = '${ApiConstant.baseUrl}registration/$registrationId?api_key=${ApiConstant.apiKey}';
    if (kDebugMode) {
      print(url);
    }
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) {
          print(jsonData);
        }
        Get.put(NewRegistrationController());
        final newRegistrationController = Get.find<NewRegistrationController>();
        await newRegistrationController.fetchRegistrations();

        Get.back();
        Get.offAll(Registration());
        Get.snackbar("Success!", "Registration deleted successfully",backgroundColor: UIColors.green170);
        return DeleteResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to delete registration');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting registration: $e');
      }
      return null;
    }
  }
}
