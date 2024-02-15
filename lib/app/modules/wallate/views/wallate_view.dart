import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wallate_controller.dart';

class WallateView extends GetView<WallateController> {
  const WallateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WallateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WallateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
