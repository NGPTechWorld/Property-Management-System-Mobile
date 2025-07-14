// lib/features/report/presentation/controllers/report_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';

class ReportController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    initAnimations();
  }

  void initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    animationController.forward();
  }

  Future<void> submitReport({
    required Future<void> Function(String reportText) onSubmit,
  }) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      await onSubmit(textController.text.trim());
      textController.clear();
      showSuccessSnackbar();
    } catch (e) {
      showErrorSnackbar(e);
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void showSuccessSnackbar() {
    Get.showSnackbar(
      const GetSnackBar(
        message: 'تم إرسال البلاغ بنجاح',
        icon: Icon(Icons.check_circle, color: ColorManager.white),
        backgroundColor: ColorManager.greenColor,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        margin: EdgeInsets.all(10),
      ),
    );
  }

  void showErrorSnackbar(dynamic error) {
    Get.showSnackbar(
      GetSnackBar(
        message: 'حدث خطأ: ${error.toString()}',
        icon: const Icon(Icons.error_outline, color: ColorManager.white),
        backgroundColor: ColorManager.redColor,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    textController.dispose();
    super.onClose();
  }
}
