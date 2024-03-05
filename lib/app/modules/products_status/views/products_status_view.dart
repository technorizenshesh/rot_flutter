import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/products_status_controller.dart';

class ProductsStatusView extends GetView<ProductsStatusController> {
  const ProductsStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.productsStatus),
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: controller.data.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => Card(
                    elevation: .2.px,
                    child: ListTile(
                      // contentPadding: EdgeInsets.zero,
                      title: Text(
                        controller.data[index].title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 20.px),
                      ),
                      subtitle: Text(
                        controller.data[index].description ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    ),
                  ),
                )
              : controller.getProductStatusModel == null
                  ? const SizedBox()
                  : CommonWidgets.dataNotFound(),
        ),
      );
    });
  }
}
