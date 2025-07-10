import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final verifectionPasswordController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isVerifectionPasswordHidden = true.obs;
}
