import 'package:get/get.dart';

import '../controllers/history_of_movements_controller.dart';

class HistoryOfMovementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryOfMovementsController>(
      () => HistoryOfMovementsController(),
    );
  }
}
