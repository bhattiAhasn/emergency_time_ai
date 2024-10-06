
import 'package:get/get.dart';

class SettingScreenController extends GetxController{

  RxBool switchValue = false.obs;

  void toggleSwitch() => switchValue.value = switchValue.value ? false : true;

}