import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUnlockController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;
  late SharedPreferences sharedPreferences;

  @override
  void onInit() async {
    super.onInit();
    sharedPreferences = await SharedPreferences.getInstance();
    switchValue.value = sharedPreferences.getBool('Lock') ?? false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  changeValue() async {
    switchValue.value = !switchValue.value;
    sharedPreferences.setBool('Lock', switchValue.value);
    increment();
  }
}
