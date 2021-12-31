import 'package:flutter/material.dart';
import 'package:flutter_employee/controller/create_user_controller.dart';
import 'package:get/get.dart';

class CreateUser extends StatelessWidget {
  CreateUser({Key? key}) : super(key: key);
  final CreateUserController controller = Get.put(CreateUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Create User',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.job,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Job',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.createUser();
              },
              child: const Text(
                'Create User',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
