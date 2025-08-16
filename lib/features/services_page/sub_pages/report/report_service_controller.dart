import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/services_repositories.dart';
import 'package:get/get.dart';

class ReportServiceController extends GetxController {
  final ServicesRepositories serviceRepo = Get.find<ServicesRepositories>();
  int id = Get.arguments;
  final loadingState = LoadingState.idle.obs;

  Future<void> postOfficeReport(String complaint) async {
    Future.delayed(const Duration(seconds: 3));
    final response = await serviceRepo.postServiceFeeback(
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
