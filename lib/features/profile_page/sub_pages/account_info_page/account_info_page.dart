import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/card_widget.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/core/utils/widgets/user_avatar_widget.dart';
import 'package:property_ms/data/models/user_model.dart';
import 'package:property_ms/features/profile_page/sub_pages/account_info_page/account_info_controller.dart';

class AccountInfoPage extends GetView<AccountInfoController> {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: "معلومات حسابي"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: CardWidget(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          onTap: () => controller.pickImage(),
                          child: UserAvatarWidget(
                            user: UserModel(
                              image:
                                  controller.profileImage.value?.path ??
                                  Assets.images.user2.path,
                            ),
                            radius: 60,
                          ),
                        ),
                      ),

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
                        readOnly: !controller.isEdit.value,
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
                      Obx(
                        () =>
                            !controller.isEdit.value
                                ? AppButton(
                                  text: "تعديل",
                                  onPressed:
                                      () =>
                                          controller.isEdit.value =
                                              !controller.isEdit.value,
                                  backgroundColor: ColorManager.primary5Color,
                                )
                                : AppButton(
                                  text: "حفظ",
                                  onPressed: () => controller.save(),
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
