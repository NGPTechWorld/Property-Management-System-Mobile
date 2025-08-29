import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/tourism_model.dart';
import 'package:property_ms/data/repos/tourism_repositories.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/models/tourism_detail_model.dart';

class CompareTourismController extends GetxController {
  final TourismRepositories tourismRepo = Get.find<TourismRepositories>();
  final loadingState = LoadingState.idle.obs;

  TourismModel? tourism11;
  TourismModel? tourism21;
  final int id1 = int.parse(Get.parameters['id1']!);
  final int id2 = int.parse(Get.parameters['id2']!);

  Future<void> get2Tourism() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    Future.delayed(const Duration(seconds: 3));
    final response1 = await tourismRepo.getTourism(id: id1);
    final response2 = await tourismRepo.getTourism(id: id2);

    if (!response1.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response1.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    if (!response2.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response2.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    tourism11 = response1.data;
    tourism21 = response2.data;
    loadingState.value = LoadingState.doneWithData;
  }

  @override
  void onInit() {
    super.onInit();
    get2Tourism();
  }
}
