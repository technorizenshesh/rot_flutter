import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
