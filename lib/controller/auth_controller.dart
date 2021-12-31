import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_employee/screen/home/home_screen.dart';
import 'package:flutter_employee/services/auth_services.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    var res =
        await AuthServices.login(email: email.text, password: password.text);
    if (res != null) {
      Get.off(() => HomeScreen());
    } else {
      Get.snackbar(
        'Failed!',
        'Wrong email or password',
        margin: const EdgeInsets.all(20.0),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
