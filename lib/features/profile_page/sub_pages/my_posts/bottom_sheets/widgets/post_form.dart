import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_controller.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class PostForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController locationController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final String propertyType;
  final void Function(String?) onTypeChanged;
  final VoidCallback onSubmit;
  final String submitLabel;

  const PostForm({
    super.key,
    required this.formKey,
    required this.locationController,
    required this.descriptionController,
    required this.priceController,
    required this.propertyType,
    required this.onTypeChanged,
    required this.onSubmit,
    required this.submitLabel,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyPostsController>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDragHandle(),

            Text(
              submitLabel,
              style: Get.textTheme.headlineSmall!.copyWith(
                color: ColorManager.primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSize.s12),
            Column(
              children: List.generate(
                (controller.postQuestionsFilters.length / 2).ceil(),
                (index) {
                  final first = controller.postQuestionsFilters[index * 2];
                  final second =
                      (index * 2 + 1) < controller.postQuestionsFilters.length
                          ? controller.postQuestionsFilters[index * 2 + 1]
                          : null;

                  return Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          title: first.title,
                          hint: 'اختر المحافظة',
                          readOnly: true,
                          textInputType: TextInputType.text,
                          textEditingController: first.controller,
                          onTap: () async {
                            await QuestionTypeWidget.showAnswer(
                              question: first,
                            );
                            if (first.id == 1) {
                              controller.onGovernorateSelected(
                                first.controller.text,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      if (second != null)
                        Expanded(
                          child: CustomTextField(
                            hint: 'اختر المنطقة',
                            textInputType: TextInputType.text,
                            title: second.title,
                            readOnly: true,
                            textEditingController: second.controller,
                            onTap: () async {
                              await QuestionTypeWidget.showAnswer(
                                question: second,
                              );
                              if (second.id == 2 &&
                                  second.selectedIndex.value != null) {
                                final selectedAnswer = second.answers
                                    .firstWhere(
                                      (a) => a.id == second.selectedIndex.value,
                                    );
                                controller.updateRegionId(selectedAnswer.id);
                              }
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            CustomTextField(
              title: 'الوصف',
              hint: 'الوصف',
              icon: const Icon(Icons.description),
              textEditingController: descriptionController,
              validator:
                  (val) =>
                      val == null || val.isEmpty ? 'الرجاء إدخال الوصف' : null,
              textInputType: TextInputType.text,
            ),
            CustomTextField(
              title: 'السعر',
              hint: 'السعر',
              icon: const Icon(Icons.attach_money),
              textEditingController: priceController,
              validator: (val) {
                if (val == null || val.isEmpty) return 'الرجاء إدخال السعر';
                if (double.tryParse(val) == null) return 'أدخل رقماً صحيحاً';
                return null;
              },
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: AppSize.s12),
            DropdownButtonFormField<String>(
              value: propertyType,
              decoration: InputDecoration(
                labelText: 'نوع العقار',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              items:
                  ['أجار', 'شراء']
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: onTypeChanged,
            ),
            const SizedBox(height: AppSize.s24),
            AppButton(
              text: submitLabel,
              onPressed: onSubmit,
              fontColor: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: FontSize.s16,
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
              radius: AppSize.s12,
              backgroundColor: ColorManager.primaryColor,
              withGradiant: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle() => Center(
    child: Container(
      width: AppSize.s40,
      height: AppSize.s4,
      margin: const EdgeInsets.only(bottom: AppSize.s16),
      decoration: BoxDecoration(
        color: ColorManager.grey3.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSize.s2),
      ),
    ),
  );
}
