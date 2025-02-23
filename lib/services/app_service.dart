import 'dart:io';
import 'package:dio/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ApiService {
  final Dio dio = Dio();
  final String url = "http://devapiv4.dealsdray.com/api/v2/user/device/add";

  // Function to get device information
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String deviceType = Platform.isAndroid ? "android" : "ios";
    String deviceId = "";
    String deviceName = "";
    String deviceOSVersion = "";
    String deviceIPAddress = "192.168.1.1"; // You can fetch real IP if needed

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      deviceName = androidInfo.model;
      deviceOSVersion = "Android ${androidInfo.version.release}";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? "";
      deviceName = iosInfo.utsname.machine ?? "";
      deviceOSVersion = "iOS ${iosInfo.systemVersion}";
    }

    return {
      "deviceType": deviceType,
      "deviceId": deviceId,
      "deviceName": deviceName,
      "deviceOSVersion": deviceOSVersion,
      "deviceIPAddress": deviceIPAddress,
      "lat": 9.9312, // Replace with real location if needed
      "long": 76.2673,
      "buyer_gcmid": "",
      "buyer_pemid": "",
      "app": {
        "version": packageInfo.version,
        "installTimeStamp": "2022-02-10T12:33:30.696Z", // Replace dynamically if needed
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
      }
    };
  }

  // Function to send API request
  Future<void> sendDeviceInfo() async {
    try {
      Map<String, dynamic> deviceData = await getDeviceInfo();
      print("📤 Sending Data: $deviceData"); // Log data before sending

      Response response = await dio.post(url, data: deviceData);

      if (response.statusCode == 200) {
        print("✅ Success: ${response.data}");
      } else {
        print("⚠️ API Failed: ${response.statusCode}, ${response.data}");
      }
    } catch (e) {
      print("❌ API Error: $e");
    }
  }
}
