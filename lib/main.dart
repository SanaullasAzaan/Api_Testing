import 'package:flutter/material.dart';
import 'package:machinetest_app/screens/homescreen.dart';
import 'package:machinetest_app/screens/login_screen.dart';
import 'package:machinetest_app/screens/otp_verification_screen.dart';
import 'package:machinetest_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: _navigatorKey,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(builder: (_) =>  SplashScreen());
          case '/':
            return MaterialPageRoute(builder: (_) => const OtpLoginScreen());
          case '/otp':
            final args = settings.arguments as Map<String, String>?;
            return MaterialPageRoute(
              builder: (_) => OtpVerificationScreen(
                mobileNumber: args?['mobileNumber'] ?? '',
                deviceId: args?['deviceId'] ?? '',
                userId: args?['userId'] ?? '',
              ),
            );
          case '/home':
            return MaterialPageRoute(builder: (_) =>  HomeScreen());
          default:
            return MaterialPageRoute(builder: (_) => const OtpLoginScreen());
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const OtpLoginScreen(),
        );
      },
    );
  }
}
