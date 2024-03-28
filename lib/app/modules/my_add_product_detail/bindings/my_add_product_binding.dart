import 'package:get/get.dart';
import 'package:rot_application/app/modules/my_add_product_detail/controllers/my_add_product_detail_controller.dart';

class MyAddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAddProductDetailController>(
        () => MyAddProductDetailController());
  }
}
