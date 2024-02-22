import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sub_category_products_controller.dart';

class SubCategoryProductsView extends GetView<SubCategoryProductsController> {
  const SubCategoryProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubCategoryProductsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubCategoryProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
