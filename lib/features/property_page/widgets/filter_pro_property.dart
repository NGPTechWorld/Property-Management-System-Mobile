import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/property_page/property_controller.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class FilterProProperty {
  static showAnswer(PropertyController controller) {
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
          initialChildSize: 0.9,
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
                      const SizedBox(height: AppSize.s24),
                      Row(
                        children: [
                          Text("نوع العقار:", style: Get.textTheme.titleMedium),
                          Expanded(
                            child: Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:
                                        () =>
                                            controller
                                                .selectedQuestionPT
                                                .value = 0,
                                    child: CardFilter(
                                      model: cardFilterDefault[1],
                                      isSelect:
                                          controller.selectedQuestionPT.value ==
                                          0,
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.s12),
                                  GestureDetector(
                                    onTap:
                                        () =>
                                            controller
                                                .selectedQuestionPT
                                                .value = 1,
                                    child: CardFilter(
                                      model: cardFilterDefault[2],
                                      isSelect:
                                          controller.selectedQuestionPT.value ==
                                          1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      const FormQuestions(),
                      Text("مجال السعر:", style: Get.textTheme.titleMedium),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlutterSlider(
                            values: [
                              controller.minPrice.value,
                              controller.maxPrice.value,
                            ],
                            rangeSlider: true,
                            max: 10000,
                            min: 0,
                            step: const FlutterSliderStep(step: 500),
                            trackBar: FlutterSliderTrackBar(
                              activeTrackBarHeight: 6,
                              inactiveTrackBarHeight: 6,
                              inactiveTrackBar: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              activeTrackBar: BoxDecoration(
                                color: ColorManager.cardHead,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            handler: FlutterSliderHandler(
                              decoration: const BoxDecoration(),
                              child: _buildThumbBubble(
                                "\$${controller.minPrice.value.toInt()}",
                              ),
                            ),
                            handlerHeight: 75,
                            rightHandler: FlutterSliderHandler(
                              decoration: const BoxDecoration(),
                              child: _buildThumbBubble(
                                "\$${controller.maxPrice.value.toInt()}",
                              ),
                            ),
                            onDragging: (handlerIndex, lowerValue, upperValue) {
                              controller.minPrice.value = lowerValue;
                              controller.maxPrice.value = upperValue;
                            },
                          ),
                        );
                      }),

                      const SizedBox(
                        width: double.infinity,
                        child: AppButton(
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

  static Widget _buildThumbBubble(String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: ColorManager.cardHead,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            value,
            style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorManager.whiteColor,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ColorManager.cardHead, width: 3),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class FormQuestions extends GetView<PropertyController> {
  const FormQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate((controller.questionsFilters.length / 2).ceil(), (
        index,
      ) {
        final first = controller.questionsFilters[index * 2];
        final second =
            (index * 2 + 1) < controller.questionsFilters.length
                ? controller.questionsFilters[index * 2 + 1]
                : null;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  title: first.title,
                  hint: "إختر الجواب",
                  readOnly: true,
                  textEditingController: first.controller,
                  textInputType: TextInputType.text,
                  fillColor: ColorManager.whiteColor,
                  onTap: () async {
                    await QuestionTypeWidget.showAnswer(question: first);
                    if (first.id == 1) {
                      controller.onGovernorateSelected(first.controller.text);
                    }
                  },
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: Assets.icons.arrowBackIcon.svg(width: AppSize.s22),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSize.s24),
              Expanded(
                child:
                    second != null
                        ? CustomTextField(
                          title: second.title,
                          hint: "إختر الجواب",
                          readOnly: true,
                          textEditingController: second.controller,
                          textInputType: TextInputType.text,
                          fillColor: ColorManager.whiteColor,
                          onTap: () async {
                            await QuestionTypeWidget.showAnswer(
                              question: second,
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
                        )
                        : Container(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
