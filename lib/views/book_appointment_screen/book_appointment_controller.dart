import 'package:get/get.dart';

class BookAppointmentController extends GetxController {

  var selectedOption = 'Morning'.obs;
  var selectedDate = ''.obs;
  var selectedTime = ''.obs;


  void setSelectedDate(String date) {
    selectedDate.value = date;
  }

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

   void setSelectedTime(String time){
    selectedTime.value = time;
   }
}
