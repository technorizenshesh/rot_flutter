import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final count = 0.obs;

  String title = '';
  Map<String, String?> parameters = Get.parameters;

  @override
  void onInit() {
    title = parameters['title'] ?? '';
    super.onInit();
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
}
