import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/package_preparation_controller.dart';

class PackagePreparationView extends GetView<PackagePreparationController> {
  const PackagePreparationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PackagePreparationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PackagePreparationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
