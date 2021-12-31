import 'package:flutter/material.dart';
import 'package:flutter_employee/services/fetch_data.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();

  void createUser() async {
    var res = await FetchData.createUser(job: job.text, name: name.text);
    if (res != null) {
      if (job.text.isEmpty || name.text.isEmpty) {
        Get.snackbar(
          'Failed',
          'Field cannot be empty',
          margin: const EdgeInsets.all(20.0),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Success',
          'User added id: ${res['id']}',
          margin: const EdgeInsets.all(20.0),
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
        job.text = '';
        name.text = '';
      }
    } else {
      Get.snackbar(
        'Failed',
        'There\'s something wrong',
        margin: const EdgeInsets.all(20.0),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
