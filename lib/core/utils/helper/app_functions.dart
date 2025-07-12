import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:property_ms/core/utils/widgets/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  // Arabic Checker
  static bool isArabicText(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]');
    return arabicRegex.hasMatch(text);
  }

  static bool intToBool(int value) {
    return value == 1 ? true : false;
  }

  static int boolToInt(bool value) {
    return value ? 1 : 0;
  }

  static bool? intToBoolOrNull(int? value) {
    if (value == null) return null;
    return value == 1 ? true : false;
  }

  static int? boolToIntOrNull(bool? value) {
    if (value == null) return null;
    return value ? 1 : 0;
  }

  // Date Picker
  static Future<DateTime?> selectDate(
    BuildContext context, {
    DateTime? firstDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(1900, 8),
      lastDate: DateTime(2101),
    );
    return picked ?? DateTime.now();
  }

  // Time Picker
  static Future<DateTime?> selectTime({TimeOfDay? initialTime}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      DateTime dateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        picked.hour,
        picked.minute,
      );
      return dateTime;
    } else {
      return null;
    }
  }

  // Image Picker
  static Future<XFile?> imagePicker(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      return null;
    }
  }

  // Multi Image Picker
  static Future<List<XFile>> multiImagePicker() async {
    final pickedImage = await ImagePicker().pickMultiImage();
    return pickedImage;
  }

  // View Image
  static void viewImage({required String? path, required bool isNetwork}) {
    if (path == null) {
      return;
    }
    String safePath = path;
    Get.to(
      () => PhotoViewWidget(imagePath: safePath, isNetworkImage: isNetwork),
    );
  }

  // Call Number
  static void callPhoneNumber(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      Get.snackbar('خطأ', 'لا يمكن إجراء الاتصال بالرقم $phoneNumber');
    }
  }

  static Future<List<PlatformFile>?> multiFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      return result.files;
    }
    return null;
  }

  static Future<PlatformFile?> filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );
    if (result != null) {
      return result.files.first;
    }
    return null;
  }

  static Future<void> openFile(String filePath) async {
    await OpenFilex.open(filePath);
  }
}
