import 'package:emergency_time/utils/libraries/app_libraries.dart';

class FeedbackController extends GetxController{

  var rating = 1.0.obs;

  void updateRating(double newRating) {
    rating.value = newRating;
  }

  String getFeedbackText() {
    if (rating.value == 5) {
      return "Excellent!";
    } else if (rating.value >= 4) {
      return "Good!";
    } else if (rating.value >= 3) {
      return "Average";
    } else if (rating.value >= 2) {
      return "Below Average";
    } else {
      return "Poor";
    }
  }

}