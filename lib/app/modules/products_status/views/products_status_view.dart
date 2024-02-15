import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

import '../controllers/products_status_controller.dart';

class ProductsStatusView extends GetView<ProductsStatusController> {
  const ProductsStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.productsStatus),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (context, index) => Card(
          elevation: .2.px,
          child: ListTile(
            // contentPadding: EdgeInsets.zero,
            title: Text(
              "In if's box",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 20.px),
            ),
            subtitle: Text(
              'Retaina orginal packaging',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
