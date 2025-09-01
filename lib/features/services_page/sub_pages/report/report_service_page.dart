import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/features/services_page/sub_pages/report/report_service_controller.dart';
import 'package:property_ms/features/widgets/report_form_reuseable/report_controller.dart';
import 'package:property_ms/features/widgets/report_form_reuseable/report_form.dart';

class ReportServicePage extends GetView<ReportServiceController> {
  const ReportServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportController(), permanent: true);

    return Scaffold(
      backgroundColor: ColorManager.cardBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تقديم بلاغ على مقدم خدمة',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorManager.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorManager.white,
            size: 22,
          ),
          onPressed: () => Get.back(),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [ColorManager.primaryColor, ColorManager.primaryDark],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ReportForm(
              onSubmit: (text) async {
                // Your submission logic
                controller.postOfficeReport(text);
                await Future.delayed(const Duration(seconds: 2));
              },
            ),
          ),
        ),
      ),
    );
  }
}
