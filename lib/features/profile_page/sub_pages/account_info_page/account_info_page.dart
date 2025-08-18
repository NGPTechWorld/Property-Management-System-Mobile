import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/card_widget.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/profile_page/sub_pages/account_info_page/account_info_controller.dart';

class AccountInfoPage extends GetView<AccountInfoController> {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: "معلومات حسابي"),
      body: Obx(() {
        if (controller.loadingState.value == LoadingState.loading &&
            controller.profileInfo == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: CardWidget(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.s8),
                    Center(
                      child: Text(
                        "الصورة الشخصية",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: ColorManager.secColor,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s8),
                    Center(
                      child: GestureDetector(
                        onTap: controller.pickImage,
                        child: Obx(() {
                          final pickedImage = controller.profileImage.value;
                          return ClipOval(
                            child:
                                pickedImage != null
                                    ? Image.file(
                                      File(pickedImage.path),
                                      height: AppSize.sHeight * 0.15,
                                      width: AppSize.sHeight * 0.15,
                                      fit: BoxFit.cover,
                                    )
                                    : CustomCachedNetworkImage(
                                      imageUrl:
                                          controller.profileInfo?.photoUrl ??
                                          '',
                                      height: AppSize.sHeight * 0.15,
                                      width: AppSize.sHeight * 0.15,
                                      fit: BoxFit.cover,
                                    ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    CustomTextField(
                      title: 'الاسم الأول',
                      hint: 'ادخل الاسم الأول',
                      readOnly: !controller.isEdit.value,
                      textEditingController: controller.firstNameController,
                      textInputType: TextInputType.name,
                      fillColor: ColorManager.primary2Color,
                      hasBorder: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                      icon: Assets.icons.userAccountIcon.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary5Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    CustomTextField(
                      title: 'الكنية',
                      hint: 'ادخل الكنية',
                      readOnly: !controller.isEdit.value,
                      textEditingController: controller.lastNameController,
                      textInputType: TextInputType.name,
                      fillColor: ColorManager.primary2Color,
                      hasBorder: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                      icon: Assets.icons.userAccountIcon.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary5Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    CustomTextField(
                      title: 'الرقم',
                      hint: '09xxxxxxxx',
                      readOnly: !controller.isEdit.value,
                      textEditingController: controller.phoneNumberController,
                      textInputType: TextInputType.number,
                      fillColor: ColorManager.primary2Color,
                      hasBorder: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !GetUtils.isPhoneNumber(value)) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                      icon: Assets.icons.callIcon.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary5Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    CustomTextField(
                      title: 'البريد الإلكتروني',
                      hint: 'example@gmail.com',
                      onTap:
                          () =>
                              const CustomToasts(
                                message: 'لا يمكن تعديل الايميل',
                                type: CustomToastType.warning,
                              ).show(),

                      readOnly: true,
                      textEditingController: controller.emailController,
                      textInputType: TextInputType.emailAddress,
                      fillColor: ColorManager.primary2Color,
                      hasBorder: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "هذا الحقل مطلوب";
                        } else if (!GetUtils.isEmail(value)) {
                          return "الايميل خطأ";
                        }
                        return null;
                      },
                      icon: Assets.icons.mailIcon.svg(
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary5Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.resetPasswordRoute);
                      },
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: Get.textTheme.bodyMedium?.copyWith(
                          color: ColorManager.primaryDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s12),
                    Obx(() {
                      final isSaving =
                          controller.loadingState.value == LoadingState.loading;
                      return AppButton(
                        text:
                            controller.isEdit.value
                                ? "حفظ"
                                : "ابدأ بتعديل البيانات",
                        onPressed:
                            isSaving
                                ? null
                                : () async {
                                  if (controller.isEdit.value) {
                                    await controller.save();
                                  } else {
                                    controller.isEdit.value = true;
                                  }
                                },
                        backgroundColor:
                            controller.isEdit.value
                                ? ColorManager.primaryColor
                                : ColorManager.primaryDark,
                        loadingMode: isSaving,
                      );
                    }),
                    const SizedBox(height: AppSize.s16),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
