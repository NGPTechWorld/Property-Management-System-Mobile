import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/profile_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class AccountInfoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Observables
  Rx<XFile?> profileImage = Rx<XFile?>(null);
  final isEdit = false.obs;
  final loadingState = LoadingState.idle.obs;

  // Text controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  // Repository
  final UsersRepositories usersRepo = Get.find<UsersRepositories>();

  // Store initial profile data
  ProfileDto? profileInfo;

  //! Pick image only in edit mode
  void pickImage() async {
    if (isEdit.value) {
      final picked = await AppFunctions.imagePicker(ImageSource.gallery);
      if (picked != null) profileImage.value = picked;
    }
  }

  //! Fetch user info from backend
  Future<void> getUserInfo() async {
    if (loadingState.value == LoadingState.loading) return;

    loadingState.value = LoadingState.loading;

    final response = await usersRepo.getUserProfileInfo();

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    profileInfo = response.data;

    // Populate text fields with backend data
    firstNameController.text = profileInfo?.firstName ?? '';
    lastNameController.text = profileInfo?.lastName ?? '';
    phoneNumberController.text = profileInfo?.phone ?? '';
    emailController.text = profileInfo?.email ?? '';

    loadingState.value = LoadingState.doneWithData;
  }

  //! Refresh data
  Future<void> refreshPage() async {
    profileInfo = null;
    loadingState.value = LoadingState.idle;
    await getUserInfo();
  }

  //! Save only edited fields
  Future<void> save() async {
    if (!formKey.currentState!.validate()) return;

    String? firstName;
    String? lastName;
    String? phone;
    String? email;
    String? imagePath;

    if (firstNameController.text.trim() != profileInfo?.firstName) {
      firstName = firstNameController.text.trim();
    }
    if (lastNameController.text.trim() != profileInfo?.lastName) {
      lastName = lastNameController.text.trim();
    }
    if (phoneNumberController.text.trim() != profileInfo?.phone) {
      phone = phoneNumberController.text.trim();
    }
    if (emailController.text.trim() != profileInfo?.email) {
      email = emailController.text.trim();
    }
    if (profileImage.value != null) {
      imagePath = profileImage.value!.path;
    }

    if (firstName == null &&
        lastName == null &&
        phone == null &&
        email == null &&
        imagePath == null) {
      const CustomToasts(
        message: "لا يوجد تغييرات للحفظ",
        type: CustomToastType.warning,
      ).show();
      isEdit.value = false;
      return;
    }

    loadingState.value = LoadingState.loading;

    final response = await usersRepo.updateUserProfile(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      imagePath: imagePath,
    );

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
    } else {
      await getUserInfo();
      const CustomToasts(
        message: "تم حفظ التغييرات بنجاح",
        type: CustomToastType.success,
      ).show();
    }

    isEdit.value = false;
  }

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose controllers
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
