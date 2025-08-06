import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/favorite_repositories.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

class FavoritesController extends GetxController {
  final List<CardFilterModel> cardFilterDefault = [
    CardFilterModel(title: "سياحي", icon: Assets.icons.tourisem),
    CardFilterModel(title: "عقاري", icon: Assets.icons.property),
  ];
  RxInt selectedFilterIndex = 0.obs;
  void selectFilter(int index) {
    selectedFilterIndex.value = index;
    getFavorite(); // Auto fetch based on new filter
  }

  final scrollFavoritesController = ScrollController();
  final favoriteList = <PropertyDto>[].obs;
  final loadingFavortieState = LoadingState.loading.obs;

  final FavoriteRepositories favoriteRepo = Get.find<FavoriteRepositories>();
  Future<void> getFavorite() async {
    loadingFavortieState.value = LoadingState.loading;

    final selectedType = cardFilterDefault[selectedFilterIndex.value].title;

    final response = await favoriteRepo.getFavorites(
      perPage: 1000,
      page: 1,
      type: selectedType,
    );

    if (!response.success) {
      loadingFavortieState.value = LoadingState.hasError;
      return;
    }

    favoriteList.value = response.data?.data ?? [];
    loadingFavortieState.value =
        favoriteList.isEmpty
            ? LoadingState.doneWithNoData
            : LoadingState.doneWithData;
  }

  final favoritesListCrd =
      [
        // PropertySaleCardModel(
        //   title: 'بيت 120 م²',
        //   location: 'دمشق القديمة',
        //   area: 120,
        //   price: 2500,
        //   image: Assets.images.officePropertyCard,
        // ),
        // PropertySaleCardModel(
        //   title: 'بيت 120 م²',
        //   location: 'دمشق القديمة',
        //   area: 120,
        //   price: 2500,
        //   image: Assets.images.officePropertyCard,
        // ),
        // PropertySaleCardModel(
        //   title: 'بيت 120 م²',
        //   location: 'دمشق القديمة',
        //   area: 120,
        //   price: 2500,
        //   image: Assets.images.officePropertyCard,
        // ),
        // PropertyRentCardModel(
        //   title: 'شقة 120 م²',
        //   location: 'دمشق, أبو رمانة',
        //   priceUnit: 'شهري',
        //   rate: 4.8,
        //   price: 3000,
        //   image: Assets.images.propertyImage,
        // ),
        // PropertyRentCardModel(
        //   title: 'بيت عربي',
        //   location: 'دمشق القديمة',
        //   priceUnit: 'شهري',
        //   rate: 4.2,
        //   price: 1800,
        //   image: Assets.images.propertyImage,
        // ),
        // PropertyRentCardModel(
        //   title: 'بيت عربي',
        //   location: 'دمشق القديمة',
        //   priceUnit: 'شهري',
        //   rate: 4.2,
        //   price: 1800,
        //   image: Assets.images.propertyImage,
        // ),
        // PropertyRentCardModel(
        //   title: 'بيت عربي',
        //   location: 'دمشق القديمة',
        //   priceUnit: 'شهري',
        //   rate: 4.2,
        //   price: 1800,
        //   image: Assets.images.propertyImage,
        // ),
      ].obs;

  //! Osama remove , add favorite
  // Future<void> toggleFavorite(PropertyDto property) async {
  //   if (property.isFavorite) {
  //     await favoriteRepo.removeFromFavorites(property.propertyId);
  //   } else {
  //     await favoriteRepo.addToFavorites(property.propertyId);
  //   }

  //   // Refresh list after change
  //   getFavorite();
  // }

  @override
  void onInit() {
    super.onInit();
    getFavorite(); // initial fetch
  }
}
