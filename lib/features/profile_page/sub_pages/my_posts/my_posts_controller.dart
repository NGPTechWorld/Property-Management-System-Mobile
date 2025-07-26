import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/card_filter.dart';

class MyPostsController extends GetxController {
  final selectedFilterIndex = 0.obs;
  final posts = <PostModel>[].obs;

  final List<CardFilterModel> cardFilter = [
    CardFilterModel(title: "الكل"),
    CardFilterModel(title: "بيع", icon: Assets.icons.property),
    CardFilterModel(title: "إيجار", icon: Assets.icons.property),
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize with sample data
    posts.addAll([
      PostModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        location: "الرياض",
        description: "مطلوب شقة مفروشة بالكامل",
        price: 250000,
        propertyType: "بيع",
        date: DateTime.now(),
      ),
      PostModel(
        id: "${DateTime.now().millisecondsSinceEpoch}1",
        location: "جدة",
        description: "مطلوب فيلا راقية للإيجار",
        price: 75000,
        propertyType: "إيجار",
        date: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ]);
  }

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  void addPost(PostModel post) {
    posts.add(post);
  }

  void updatePost(PostModel updatedPost) {
    final index = posts.indexWhere((p) => p.id == updatedPost.id);
    if (index != -1) {
      posts[index] = updatedPost;
    }
  }

  void deletePost(String postId) {
    posts.removeWhere((p) => p.id == postId);
  }
}

class PostModel {
  final String id;
  final String location;
  final String description;
  final double price;
  final String propertyType;
  final DateTime date;

  PostModel({
    required this.id,
    required this.location,
    required this.description,
    required this.price,
    required this.propertyType,
    required this.date,
  });

  PostModel copyWith({
    String? id,
    String? location,
    String? description,
    double? price,
    String? propertyType,
    DateTime? date,
  }) {
    return PostModel(
      id: id ?? this.id,
      location: location ?? this.location,
      description: description ?? this.description,
      price: price ?? this.price,
      propertyType: propertyType ?? this.propertyType,
      date: date ?? this.date,
    );
  }
}
