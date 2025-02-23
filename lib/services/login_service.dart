import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginApiService {
  static const String baseUrl = "http://devapiv4.dealsdray.com/api/v2/user";

  // Send OTP Function
  static Future<String?> sendOtp(String mobile, String deviceId) async {
    try {
      print("Starting OTP send process...");
      final url = Uri.parse('$baseUrl/otp');

      final Map<String, dynamic> body = {
        'mobileNumber': '+91${mobile.trim()}', // Add country code
        'deviceId': deviceId,
      };

      print('Request Body: ${jsonEncode(body)}');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('The connection has timed out, Please try again!');
        },
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['status'] == 1 && data['data'] != null) {
          return data['data']['userId']?.toString();
        }
      }
      return null;
    } catch (e) {
      print("Error sending OTP: $e");
      return null;
    }
  }

  // Verify OTP Function
  static Future<bool> verifyOtp(String otp, String deviceId, String userId) async {
    final url = Uri.parse('$baseUrl/otp/verification');

    final Map<String, dynamic> body = {
      'otp': otp,
      'deviceId': deviceId,
      'userId': userId,
    };

    try {
      print('=================== VERIFYING OTP REQUEST ===================');
      print('URL: $url');
      print('Request Body: ${jsonEncode(body)}');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      print('=================== VERIFY OTP RESPONSE ===================');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        print('OTP Verified Successfully');
        return true;
      } else {
        print('OTP Verification Failed');
        print('Error response: ${response.body}');
        return false;
      }
    } catch (e) {
      print('=================== VERIFY OTP ERROR ===================');
      print('Error verifying OTP: $e');
      return false;
    }
  }
}
