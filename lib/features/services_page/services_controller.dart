import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/entity/services_card_model.dart';
import 'package:property_ms/data/enums/property_service_provider_type_enum.dart';
import 'package:property_ms/features/services_page/widgets/filter_pro_service.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class ServicesController extends GetxController {
  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;
  List<CardFilterModel> cardFiltter =
      PropertyServiceProviderType.values
          .map((e) => CardFilterModel(title: e.value))
          .toList();

  final govermentQuestion = QuestionModel(
    title: "المحافظة",
    type: QuestionType.oneSelect,
    answers: [
      ValueAnser(id: 1, name: "دمشق"),
      ValueAnser(id: 2, name: "حلب"),
      ValueAnser(id: 3, name: "ادلب"),
    ],
    id: 1,
  );
  final locationQuestion = QuestionModel(
    title: "المنطقة",
    type: QuestionType.oneSelect,
    answers: [
      ValueAnser(id: 1, name: "ميدان"),
      ValueAnser(id: 2, name: "حلبوني"),
      ValueAnser(id: 3, name: "شي مكان حلو متلك"),
    ],
    id: 1,
  );
  final topServices = [
    ServicesCardModel(
      title: "ابو يحيى",
      location: 'دمشق القديمة',
      tupe: "تصوير احترافي",
      rate: 4.3,
      image: Assets.images.propertyImage,
    ),
    ServicesCardModel(
      title: "ابو يحيى",
      location: 'دمشق القديمة',
      tupe: "تصوير احترافي",
      rate: 4.3,
      image: Assets.images.propertyImage,
    ),
    ServicesCardModel(
      title: "ابو يحيى",
      location: 'دمشق القديمة',
      tupe: "تصوير احترافي",
      rate: 4.3,
      image: Assets.images.propertyImage,
    ),
  ];

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  openFilterPagePro() {
    FilterProService.showAnswer();
  }
}
