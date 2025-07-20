import 'package:get/get.dart';

class ServiceDetailController extends GetxController {
  RxDouble rating = 4.0.obs;

  void updateOfficeRating(double newRating) {
    rating.value = newRating;

    // Optional: update the model
    // model.rate = newRating.toString();

    // Optional: send rating to backend or local DB
    print('Updated rating: $newRating');
  }
}
