import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';

class LoginController extends GetxController {
  final loadingState = LoadingState.idle.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
}
