import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_controller.dart';

class ChangeView extends GetView<ChangeController> {
  const ChangeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChangeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
