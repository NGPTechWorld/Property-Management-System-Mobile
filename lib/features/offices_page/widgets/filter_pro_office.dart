import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/offices_page/offices_controller.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class FilterProOffice {
  static showAnswer() {
    final controller = Get.find<OfficesController>();
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.55,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          "فلاتر البحث",
                          style: Get.textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: AppSize.s16),
                      CustomTextField(
                        title: "المحافظة",
                        hint: "إختر المحافظة",
                        readOnly: true,
                        textEditingController:
                            controller.govermentQuestion.controller,
                        textInputType: TextInputType.text,
                        fillColor: ColorManager.whiteColor,
                        onTap: () async {
                          await QuestionTypeWidget.showAnswer(
                            question: controller.govermentQuestion,
                          );
                          controller.onGovernorateSelected(
                            controller.govermentQuestion.controller.text,
                          );
                        },
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Transform.rotate(
                            angle: -pi / 2,
                            child: Assets.icons.arrowBackIcon.svg(
                              width: AppSize.s22,
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                        title: "المنطقة",
                        hint: "إختر المنطقة",
                        readOnly: true,
                        textEditingController:
                            controller.locationQuestion.controller,
                        textInputType: TextInputType.text,
                        fillColor: ColorManager.whiteColor,
                        onTap: () {
                          QuestionTypeWidget.showAnswer(
                            question: controller.locationQuestion,
                          );
                        },
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Transform.rotate(
                            angle: -pi / 2,
                            child: Assets.icons.arrowBackIcon.svg(
                              width: AppSize.s22,
                            ),
                          ),
                        ),
                      ),
                      Text("التقييم: ", style: Get.textTheme.titleMedium),
                      const SizedBox(height: AppSize.s8),
                      _buildRatingRow(),
                      const SizedBox(height: AppSize.s24),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          onPressed: () {
                            controller.refreshPage();
                            Get.back();
                          },
                          backgroundColor: ColorManager.secColor,
                          text: "تطبيق",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildRatingRow() {
    final controller = Get.find<OfficesController>();
    List<int> stars = [1, 2, 3, 4, 5];
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            stars.map((e) {
              bool isSelected = e == controller.selectedIndexRateFilter.value;
              return GestureDetector(
                onTap: () {
                  controller.selectedIndexRateFilter.value = e;
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? ColorManager.purble : Colors.white,
                    border: Border.all(color: ColorManager.purble),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$e",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: AppSize.s2),

                        Icon(
                          Icons.star,
                          size: 16,
                          color: isSelected ? Colors.white : Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
