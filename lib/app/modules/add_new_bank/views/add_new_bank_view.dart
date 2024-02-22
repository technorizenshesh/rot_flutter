import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_new_bank_controller.dart';

class AddNewBankView extends GetView<AddNewBankController> {
  const AddNewBankView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNewBankView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddNewBankView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
