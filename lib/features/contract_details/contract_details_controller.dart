import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/payment_dto.dart';
import 'package:property_ms/data/dto/user_invoice_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';
import 'package:property_ms/features/contract_details/widgets/download_diloag.dart';
import 'package:property_ms/features/main_page/main_controller.dart';
import 'package:property_ms/features/widgets/loading_diloag.dart';

class ContractDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final loadingState = LoadingState.idle.obs;
  final typeContract =
      ContractTypes.fromValue(Get.parameters["typeContract"] ?? "").obs;
  final userReservation = Get.arguments;
  late TabController tabController;
  final mainController = Get.find<MainController>();
  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
    getUserInvoice();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> refreshPage() async {
    currentBillList.clear();
    previousBillList.clear();
    await getUserInvoice();
  }

  final currentBillList = <CurrentPurchaseItemDto>[].obs;
  final previousBillList = <PurchaseItemDto>[].obs;
  final tabs = ["الفواتير الحالية", "الفواتير السابقة"];

  Future<void> getUserInvoice() async {
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 1));
    final response = await userRepo.getUserInvoice(
      id: userReservation.propertyId!,
    );

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    currentBillList.addAll(response.data!.current);
    previousBillList.addAll(response.data!.previous);

    loadingState.value = LoadingState.doneWithData;
  }

  final progress = RxDouble(0);
  void downloadFile(String path) async {
    if (progress.value != 0) return;

    DownloadDialog().show();

    final response = await userRepo.downloadDocument(path, "فاتورة", progress);

    if (!response.success) {
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    final file = response.data!;
    // close dialog
    Get.back();
    progress.value = 0;
    // open file

    AppFunctions.openFile(file.path);
  }

  //! Pay Invoice
  final loadingStateReservaion = LoadingState.idle.obs;
  confirmPay(CurrentPurchaseItemDto model) async {
    if (loadingStateReservaion.value == LoadingState.loading) return;
    loadingStateReservaion.value = LoadingState.loading;
    LoadingDiloag.show();
    final response = await userRepo.paymentCreate(amount: model.amount);
    Get.back();
    if (!response.success) {
      loadingStateReservaion.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    final bool statePay = await mainController.makePayment(
      response.data!.clientSecret,
    );

    if (statePay) {
      await postBook(response.data!, model.id);
    } else {}
    loadingStateReservaion.value = LoadingState.doneWithData;
  }

  postBook(PaymentDto pay, int id) async {
    loadingStateReservaion.value = LoadingState.loading;
    final response = await userRepo.payInvoice(id: id, payId: pay.paymentId);
    if (!response.success) {
      loadingStateReservaion.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }

    refreshPage();
    loadingStateReservaion.value = LoadingState.doneWithData;
  }
}

enum ContractTypes {
  rentProperty('rentProperty'),
  rentToursem('rentToursem'),
  sale('sale');

  final String code;
  const ContractTypes(this.code);

  factory ContractTypes.fromValue(String value) {
    return ContractTypes.values.firstWhere(
      (e) => e.code == value,
      orElse: () => ContractTypes.rentProperty,
    );
  }
}
