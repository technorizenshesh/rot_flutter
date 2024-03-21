import 'package:get/get.dart';
import 'package:rot_application/app/modules/add_new_card/controllers/AddNewCardController.dart';

class AddNewCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewCardController>(() => AddNewCardController());
  }
}
