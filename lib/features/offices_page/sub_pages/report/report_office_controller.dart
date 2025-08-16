import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/offices_repositories.dart';

class ReportOfficeController extends GetxController {
  final OfficesRepositories officeRepo = Get.find<OfficesRepositories>();
  int id = Get.arguments;
  final loadingState = LoadingState.idle.obs;

  Future<void> postOfficeReport(String complaint) async {
    Future.delayed(const Duration(seconds: 3));
    final response = await officeRepo.postOfficeReport(
      id: id,
      complaint: complaint,
    );

    if (!response.success) {
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();
    Get.back();
  }
}
