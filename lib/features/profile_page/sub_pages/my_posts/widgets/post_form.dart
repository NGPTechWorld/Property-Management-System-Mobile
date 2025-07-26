import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';

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
            CustomTextField(
              title: 'الموقع',
              hint: 'الموقع',
              icon: const Icon(Icons.location_on),
              textEditingController: locationController,
              validator: (val) =>
                  val == null || val.isEmpty ? 'الرجاء إدخال الموقع' : null,
              textInputType: TextInputType.text,
            ),
            CustomTextField(
              title: 'الوصف',
              hint: 'الوصف',
              icon: const Icon(Icons.description),
              textEditingController: descriptionController,
              validator: (val) =>
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
              items: ['إيجار', 'بيع']
                  .map((type) =>
                      DropdownMenuItem(value: type, child: Text(type)))
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
