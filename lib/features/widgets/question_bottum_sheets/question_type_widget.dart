import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/card_anser_one.dart';
import 'package:property_ms/features/widgets/question_bottum_sheets/card_answer_multi.dart';

enum QuestionType { oneSelect, multiSelect }

class QuestionModel {
  final int id;
  final String title;
  final QuestionType type;
  final List<ValueAnser> answers;
  final TextEditingController controller = TextEditingController();
  final RxnInt selectedIndex = RxnInt();
  final RxList<int> selectedIndices = <int>[].obs;

  QuestionModel({
    required this.title,
    required this.type,
    required this.answers,
    required this.id,
  });
}

class QuestionTypeWidget {
  static showAnswer({
    required QuestionModel question,
  }) async {
    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: ColorManager.cardBackground,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            UnconstrainedBox(
                              child: CircleAvatar(
                                radius: AppSize.s18,
                                backgroundColor: ColorManager.greyColor100,
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Assets.icons.cancelIcon.svg(
                                    colorFilter: const ColorFilter.mode(
                                      ColorManager.blackColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  question.title,
                                  style: Get.textTheme.headlineSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s4),
                  question.type == QuestionType.oneSelect
                      ? Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: question.answers.length,
                          itemBuilder:
                              (context, index) => Obx(
                                () => CardAnserOne(
                                  index: index,
                                  isSelected:
                                      question.selectedIndex.value ==
                                      question.answers[index].id,
                                  text: question.answers[index].name,
                                  onTap: () {
                                    question.selectedIndex.value =
                                        question.answers[index].id;
                                    question.controller.text =
                                        question.answers[index].name;
    
                                    Get.back();
                                  },
                                ),
                              ),
                        ),
                      )
                      : question.type == QuestionType.multiSelect
                      ? Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: question.answers.length,
                          itemBuilder:
                              (context, index) => Obx(
                                () => CardAnswerMulti(
                                  index: question.answers[index].id,
                                  isSelected: question.selectedIndices.contains(
                                    question.answers[index].id,
                                  ),
                                  text: question.answers[index].name,
                                  onTap: () {
                                    if (question.selectedIndices.contains(
                                      question.answers[index].id,
                                    )) {
                                      question.selectedIndices.remove(
                                        question.answers[index].id,
                                      );
                                    } else {
                                      question.selectedIndices.add(
                                        question.answers[index].id,
                                      );
                                    }
                                    String s = "";
                                    final selectedNames =
                                        question.selectedIndices.map((a) {
                                          final index = question.answers
                                              .indexWhere(
                                                (element) => element.id == a,
                                              );
                                          return question.answers[index].name;
                                        }).toList();

                                    s += selectedNames.join(', ');
                                    question.controller.text = s;
                                  },
                                ),
                              ),
                        ),
                      )
                      : Container(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ValueAnser {
  final int id;
  final String name;
  final String? image;

  ValueAnser({required this.id, required this.name, this.image});

  ValueAnser copyWith({int? id, String? name, String? image, int? filterId}) =>
      ValueAnser(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  factory ValueAnser.fromJson(Map<String, dynamic> json) => ValueAnser(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "image": image};

  static List<ValueAnser> fromJsonArray(List<dynamic> jsonArray) {
    return List.from(jsonArray.map((e) => ValueAnser.fromJson(e)));
  }
}
