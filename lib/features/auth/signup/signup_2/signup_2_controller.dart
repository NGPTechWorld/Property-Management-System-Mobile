import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup2Controller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifectionPasswordController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isVerifectionPasswordHidden = true.obs;
}
