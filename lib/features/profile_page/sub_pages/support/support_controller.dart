import 'package:get/get.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/support_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class SupportController extends GetxController {
  var faqItems = <FAQItem>[].obs;
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  @override
  void onInit() {
    super.onInit();
    getSupports();
  }

  refreshPage() async {
    supportList.clear();
    faqItems.clear();
    getSupports();
  }

  final supportList = <SupportDto>[].obs;
  final loadingState = LoadingState.idle.obs;

  Future<void> getSupports() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    final response = await userRepo.getSupports();

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    supportList.addAll(response.data!);
    faqItems.addAll(
      supportList.map(
        (element) =>
            FAQItem(question: element.question, answer: element.answer),
      ),
    );
    loadingState.value =
        supportList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
  }

  void toggleFAQ(int index) {
    faqItems[index].isExpanded = !faqItems[index].isExpanded;
    faqItems.refresh();
  }
}

class FAQItem {
  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  final String question;
  final String answer;
  bool isExpanded;
}
