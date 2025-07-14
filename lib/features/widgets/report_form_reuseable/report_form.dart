// lib/features/report/presentation/widgets/report_form.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/features/widgets/report_form_reuseable/report_controller.dart';

class ReportForm extends StatelessWidget {
  final Future<void> Function(String reportText) onSubmit;
  final String title;
  final String description;
  final String hintText;
  final String submitText;
  final String validationMessage;

  const ReportForm({
    super.key,
    required this.onSubmit,
    this.title = 'اكتب شكواك',
    this.description = 'سنقوم بمعالجة بلاغك في أقرب وقت ممكن',
    this.hintText = 'اكتب تفاصيل البلاغ هنا...',
    this.submitText = 'إرسال البلاغ',
    this.validationMessage = 'الرجاء كتابة تفاصيل البلاغ',
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReportController>();

    return SlideTransition(
      position: controller.slideAnimation,
      child: FadeTransition(
        opacity: controller.fadeAnimation,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withOpacity(0.05),
                blurRadius: 32,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primaryDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorManager.textColor1,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: controller.textController,
                  maxLines: 6,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: ColorManager.primaryDark),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: ColorManager.textColor1.withOpacity(0.4),
                    ),
                    filled: true,
                    fillColor: ColorManager.cardBack3,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: ColorManager.primaryColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return validationMessage;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                Obx(() {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient:
                          controller.isLoading.value
                              ? null
                              : const LinearGradient(
                                colors: [
                                  ColorManager.primaryColor,
                                  ColorManager.primaryDark,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                      boxShadow:
                          controller.isLoading.value
                              ? null
                              : [
                                BoxShadow(
                                  color: ColorManager.primaryColor.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                    ),
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading.value
                              ? null
                              : () =>
                                  controller.submitReport(onSubmit: onSubmit),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                        // backgroundColor:
                        //     controller.isLoading.value
                        //         ? ColorManager.grey
                        //         : Colors.transparent,
                        shadowColor: ColorManager.transparentColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child:
                          controller.isLoading.value
                              ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorManager.grey3,
                                  ),
                                ),
                              )
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.send,
                                    color: ColorManager.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    submitText,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
