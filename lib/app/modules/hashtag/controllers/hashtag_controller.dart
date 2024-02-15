import 'package:get/get.dart';

class HashtagController extends GetxController {
  final count = 0.obs;

  List list = [
    '#arduino',
    '#bajoconsumo',
    '#bluetooth',
    '#ebook',
    '#geek',
    '#piezaselectrónica',
    '#sistemaalarma',
  ];

  final selectedValue = '#arduino'.obs;

  @override
  void onInit() {
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
