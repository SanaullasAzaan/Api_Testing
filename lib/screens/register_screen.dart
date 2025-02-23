import 'package:flutter/material.dart';
import 'package:machinetest_app/services/register_service.dart';
import 'package:machinetest_app/screens/homescreen.dart';
import '../widgets/container_logo.dart';
import '../widgets/display_text.dart';
import '../widgets/forward_floating_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  bool _isLoading = false;
  String? _responseMessage;
  bool _isError = false;
  bool _obscurePassword = true;

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _responseMessage = null;
      _isError = false;
    });

    try {
      // Only include referral code if it's not empty
      String? referralCode = _referralController.text.trim().isEmpty 
          ? null 
          : _referralController.text.trim();

      final response = await RegisterService().registerUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        referralCode: referralCode,  // Pass null if empty
      );


      setState(() {
        _responseMessage = "Registration successful!";
        _isError = false;
      });

      // Navigate to home screen after successful registration
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false,
        );
      });

    } catch (e) {
      setState(() {
        // Make error message more user-friendly
        String errorMessage = e.toString().replaceAll("Exception: ", "");
        if (errorMessage == "Referral does not exist") {
          errorMessage = "Invalid referral code. Please check and try again.";
        }
        _responseMessage = errorMessage;
        _isError = true;
      });

      // Show error in SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_responseMessage!),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }

    setState(() => _isLoading = false);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,}$').hasMatch(value)) {
      return "Password must contain uppercase, lowercase, number and special character";
    }
    return null;
  }

  String? _validateReferralCode(String? value) {
    if (value == null || value.isEmpty) {
      return null;  // Referral code is optional
    }
    if (!RegExp(r'^[0-9]{8}$').hasMatch(value)) {
      return "Please enter a valid 8-digit referral code";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                ContainerLogo(
                  imagePath: 'assets/images/mainlogo.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                
                // Display Text instead of Custom Text
                const DisplayText(
                  text: 'Lets Begin!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const DisplayText(
                  text: 'Please Enter your credentials to proceed',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // Updated Password Field with suffix icon
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(height: 20),

                // Referral Code Field
                TextFormField(
                  controller: _referralController,
                  decoration: const InputDecoration(
                    labelText: "Referral Code (Optional)",
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ForwardFloatingButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
