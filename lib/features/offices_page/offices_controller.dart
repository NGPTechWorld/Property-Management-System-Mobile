import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/office_card.dart';

class OfficesController extends GetxController {
  final sliderIndex = 0.obs;
  final adsSliderImages =
      <String>[
        "https://cdn.create.vista.com/downloads/61354a3a-e21b-430a-b271-b7c7a0197718_1024.jpeg",
        "https://assets.onepropertee.com/720x540/listing_images/285930354-345961094308908-6834786337806892984-n.jDQ7eZZK5ADBSnuNR.jpg",
        "https://img.freepik.com/free-psd/summer-sales-banner-template-with-colorful-triangular-shapes_23-2148151183.jpg",
        "https://img.freepik.com/free-vector/online-shopping-landing-page_23-2148789076.jpg?semt=ais_hybrid&w=740",
      ].obs;

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

  RxInt selectedFilterIndex = 0.obs;
  RxBool isFiltterShow = false.obs;

  final cardFilters = [];
  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cardFilters.assignAll([
      CardFilterModel(title: "الكل", index: 0, onTap: () => selectFilter(0)),
      CardFilterModel(
        title: "سياحي",
        index: 1,
        onTap: () => selectFilter(1),
        icon: Assets.icons.tourisem,
      ),
      CardFilterModel(
        title: "عقاري",
        index: 2,
        onTap: () => selectFilter(2),
        icon: Assets.icons.property,
      ),
    ]);
  }
}
