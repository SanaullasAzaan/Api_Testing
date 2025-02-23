import 'package:dio/dio.dart';

class RegisterService {
  final Dio _dio = Dio();
  final String url = "http://devapiv4.dealsdray.com/api/v2/user/email/referral";

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    String? referralCode,
  }) async {
    try {
      // Create the base request data with deviceId
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
        "deviceId": "67b74227ac0f95f80ddd4ba7"
      };

      // Add referralCode if provided, ensuring it's an integer
      if (referralCode != null && referralCode.isNotEmpty) {
        try {
          int referralInt = int.parse(referralCode);
          data["referralCode"] = referralInt;
        } catch (e) {
          print("Error converting referral code: $e");
          throw Exception("Invalid referral code format");
        }
      }

      print("📤 Sending Data: $data");

      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) => status! < 500,
        ),
      );

      print("✅ Response: ${response.data}");

      // Check for error in response data first
      if (response.data is Map) {
        if (response.data['status'] == 0) {
          final message = response.data['data']?['message'] ?? 
                         response.data['message'] ?? 
                         'Registration failed. Please try again.';
          throw Exception(message);
        }
      }

      // Only check status code if no error in response data
      if (response.statusCode == 409) {
        throw Exception("Email already exists. Please use a different email.");
      }

      return response.data;

    } on DioException catch (e) {
      print("❌ Dio Error: ${e.message}");
      if (e.response != null) {
        print("❌ Response Data: ${e.response?.data}");
        String errorMessage = 'Registration failed. Please try again.';
        if (e.response?.data is Map) {
          errorMessage = e.response?.data['data']?['message'] ?? 
                        e.response?.data['message'] ?? 
                        errorMessage;
        }
        throw Exception(errorMessage);
      }
      throw Exception('Network error occurred. Please check your connection.');
    } catch (e) {
      print("❌ Error: $e");
      throw Exception(e.toString().replaceAll("Exception: ", ""));
    }
  }
}
