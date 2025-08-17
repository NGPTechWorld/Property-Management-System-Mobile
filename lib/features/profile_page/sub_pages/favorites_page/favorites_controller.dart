import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/repos/favorite_repositories.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

class FavoritesController extends GetxController {
  final FavoriteRepositories favoriteRepo = Get.find<FavoriteRepositories>();
  final List<CardFilterModel> cardFilterDefault = [
    CardFilterModel(title: "سياحي", icon: Assets.icons.tourisem),
    CardFilterModel(title: "عقاري", icon: Assets.icons.property),
  ];
  RxInt selectedFilterIndex = 0.obs;
  final scrollFavoritesController = ScrollController();
  final favoriteList = [].obs;
  final loadingFavortieState = LoadingState.loading.obs;

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
    favoriteList.clear();
    getFavorite();
  }

  Future<void> getFavorite() async {
    loadingFavortieState.value = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 2));
    final selectedType = cardFilterDefault[selectedFilterIndex.value].title;
    late AppResponse<PaginatedModel<dynamic>> response;
    if (selectedType == 'عقاري') {
      response = await favoriteRepo.getFavorites<PropertyDto>(
        perPage: 10,
        page: 1,
        type: selectedType,
        fromJson: PropertyDto.fromJson,
      );
    } else if (selectedType == 'سياحي') {
      response = await favoriteRepo.getFavorites<TourismDto>(
        perPage: 10,
        page: 1,
        type: selectedType,
        fromJson: TourismDto.fromJson,
      );
    } else {
      loadingFavortieState.value = LoadingState.hasError;
      return;
    }

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

  Future<void> refreshPage() async {
    favoriteList.clear();
    await getFavorite();
  }

  //!  remove , add favorite
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
  void onInit() async {
    await getFavorite();
    super.onInit();
  }
}
