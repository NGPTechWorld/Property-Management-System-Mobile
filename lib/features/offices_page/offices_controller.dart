import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/question_type_widget.dart';

class OfficesController extends GetxController {
  final sliderIndex = 1.obs;
  RxInt selectedFilterIndex = 1.obs;
  RxBool isFiltterShow = false.obs;
  RxInt selectedIndexRateFilter = 3.obs;
  final adsSliderImages =
      <String>[
        "https://cdn.create.vista.com/downloads/61354a3a-e21b-430a-b271-b7c7a0197718_1024.jpeg",
        "https://assets.onepropertee.com/720x540/listing_images/285930354-345961094308908-6834786337806892984-n.jDQ7eZZK5ADBSnuNR.jpg",
        "https://img.freepik.com/free-psd/summer-sales-banner-template-with-colorful-triangular-shapes_23-2148151183.jpg",
        "https://img.freepik.com/free-vector/online-shopping-landing-page_23-2148789076.jpg?semt=ais_hybrid&w=740",
      ].obs;
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
  final topOffices = [
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب الاحتراف",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب التميز",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب الحوت",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
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
}
