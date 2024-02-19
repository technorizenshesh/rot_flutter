import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_summary_controller.dart';

class DeliverySummaryView extends GetView<DeliverySummaryController> {
  const DeliverySummaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliverySummaryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliverySummaryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
