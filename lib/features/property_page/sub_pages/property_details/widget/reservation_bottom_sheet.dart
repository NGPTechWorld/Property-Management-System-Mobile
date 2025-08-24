import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/custom_text_field.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';

class ReservationBottomSheetProperty {
  static show() async {
    final controller = Get.find<PropertyDetailsController>();

    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: ColorManager.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            height:
                controller.propertyDetails!.listingType == "بيع"
                    ? MediaQuery.of(context).size.height * 0.6
                    : MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: AppSize.s18,
                        backgroundColor: ColorManager.greyColor100,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: AppSize.s18,
                          onPressed: () => Get.back(),
                          icon: Assets.icons.cancelIcon.svg(
                            colorFilter: const ColorFilter.mode(
                              ColorManager.blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            controller.propertyDetails!.listingType == "بيع"
                                ? "إشتري الآن"
                                : "إحجز الآن",
                            style: Get.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primary7Color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: ColorManager.primary3Color),
                  controller.propertyDetails!.sellDetails != null &&
                          controller
                              .propertyDetails!
                              .sellDetails!
                              .installmentAllowed
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Row(
                              children: [
                                Text(
                                  "أقبل التقسيط",
                                  style: Get.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.primary7Color,
                                  ),
                                ),
                                Checkbox(
                                  value: controller.isInstallment.value,
                                  onChanged:
                                      (value) =>
                                          controller.isInstallment.value =
                                              !controller.isInstallment.value,
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () =>
                                controller.isInstallment.value
                                    ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: AppSize.s8),
                                        LabelRecevation(
                                          title: "عدد الأقساط:",
                                          value:
                                              "${controller.propertyDetails!.sellDetails!.installmentDuration}",
                                        ),
                                        const SizedBox(height: AppSize.s4),

                                        LabelRecevation(
                                          title: "سعر القسط:",
                                          value:
                                              "${(((controller.propertyDetails!.sellDetails!.sellingPrice * controller.officePrice) + controller.propertyDetails!.sellDetails!.sellingPrice) / controller.propertyDetails!.sellDetails!.installmentDuration).toStringAsFixed(2)} \$",
                                        ),
                                      ],
                                    )
                                    : Container(),
                          ),
                        ],
                      )
                      : Container(),
                  controller.propertyDetails!.rentDetails != null
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تفاصيل الحجز:",
                            style: Get.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primary7Color,
                            ),
                          ),
                          const SizedBox(height: AppSize.s8),
                          SizedBox(
                            width: AppSize.sWidth * 0.4,

                            child: CustomTextField(
                              title:
                                  controller
                                              .propertyDetails!
                                              .rentDetails!
                                              .rentalPeriod ==
                                          "شهري"
                                      ? "عدد الأشهر"
                                      : "عدد السنين",
                              hint: "اكتب عدداً",
                              textEditingController:
                                  controller.reantNumberController,
                              onChanged: (p0) {
                                if (p0 != "") {
                                  controller.reantNumber.value = int.parse(p0);
                                }
                              },
                              textInputType: TextInputType.number,
                            ),
                          ),
                        ],
                      )
                      : Container(),

                  const SizedBox(height: AppSize.s16),
                  Text(
                    "تفاصيل الأسعار:",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary7Color,
                    ),
                  ),
                  const SizedBox(height: AppSize.s8),
                  controller.propertyDetails!.listingType == "بيع"
                      ? Column(
                        spacing: 8,
                        children: [
                          LabelRecevation(
                            title: "سعر العقار:",
                            value:
                                "${controller.propertyDetails!.sellDetails!.sellingPrice.toDouble()} \$",
                          ),
                          LabelRecevation(
                            title: "عمولة المكتب:",
                            value:
                                "${(controller.propertyDetails!.sellDetails!.sellingPrice * controller.officePrice).toStringAsFixed(2)} \$",
                          ),
                          LabelRecevation(
                            title: "السعر الإجمالي:",
                            value:
                                "${(controller.propertyDetails!.sellDetails!.sellingPrice * controller.officePrice) + controller.propertyDetails!.sellDetails!.sellingPrice} \$",
                          ),
                        ],
                      )
                      : Obx(
                        () => Column(
                          spacing: 8,
                          children: [
                            controller
                                        .propertyDetails!
                                        .rentDetails!
                                        .rentalPeriod ==
                                    "شهري"
                                ? LabelRecevation(
                                  title: "سعر العقار بالشهر:",
                                  value:
                                      "${controller.propertyDetails!.rentDetails!.price} \$",
                                )
                                : LabelRecevation(
                                  title: "سعر العقار بالسنة:",
                                  value:
                                      "${controller.propertyDetails!.rentDetails!.price} \$",
                                ),
                            LabelRecevation(
                              title: "سعر العقار كامل:",
                              value:
                                  "${controller.propertyDetails!.rentDetails!.price * controller.reantNumber.value} \$",
                            ),
                            LabelRecevation(
                              title: "عمولة المكتب:",
                              value:
                                  "${((controller.propertyDetails!.rentDetails!.price * controller.reantNumber.value) * controller.officePrice).toStringAsFixed(2)} \$",
                            ),
                            LabelRecevation(
                              title: "السعر الإجمالي:",
                              value:
                                  "${(((controller.propertyDetails!.rentDetails!.price * controller.reantNumber.value) * controller.officePrice) + (controller.propertyDetails!.rentDetails!.price * controller.reantNumber.value)).toStringAsFixed(2)} \$",
                            ),
                          ],
                        ),
                      ),

                  const SizedBox(height: AppSize.s16),

                  Text(
                    "إدفع الفاتورة التالية:",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary7Color,
                    ),
                  ),
                  const SizedBox(height: AppSize.s16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.primary2Color,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(
                          controller.propertyDetails!.rentDetails != null
                              ? (controller
                                          .propertyDetails!
                                          .rentDetails!
                                          .rentalPeriod ==
                                      "شهري"
                                  ? "أجار الشهر 1"
                                  : "أجار السنة 1 ")
                              : "العربون",
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primaryDark,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              controller.propertyDetails!.rentDetails != null
                                  ? "${((((controller.propertyDetails!.rentDetails!.price * controller.reantNumber.value) * controller.officePrice) + (controller.propertyDetails!.rentDetails!.price * controller.reantNumber.value)) / controller.reantNumber.value).toStringAsFixed(2)} \$"
                                  : "${(controller.arbonPrice * controller.propertyDetails!.area).toStringAsFixed(2)} \$",
                              style: Get.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.primaryDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSize.s24),
                  Obx(
                    () =>
                        controller.propertyDetails!.listingType == "بيع"
                            ? AppButton(
                              text: "إدفع",
                              onPressed: () => controller.confirmReservation(),
                              loadingMode:
                                  controller.loadingStateReservaion.value ==
                                  LoadingState.loading,
                              backgroundColor: ColorManager.primaryDark,
                            )
                            : AppButton(
                              text: "إدفع",

                              onPressed: () => controller.confirmReservation(),
                              loadingMode:
                                  controller.loadingStateReservaion.value ==
                                  LoadingState.loading,
                              backgroundColor: ColorManager.primaryDark,
                            ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LabelRecevation extends StatelessWidget {
  const LabelRecevation({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.cardHead,
            ),
          ),
        ),
      ],
    );
  }
}
