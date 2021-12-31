import 'package:flutter/material.dart';
import 'package:flutter_employee/controller/home_controller.dart';
import 'package:flutter_employee/screen/create_user/create_user_screen.dart';
import 'package:flutter_employee/screen/home/user_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    //Alert
    showAlertDialog(BuildContext context) {
      Widget ok = TextButton(
        child: const Text('Ok'),
        onPressed: () {
          controller.searchUser();
        },
      );

      Widget cancel = TextButton(
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        onPressed: () {
          Get.back();
        },
      );

      AlertDialog alert = AlertDialog(
        title: const Text('Search Employee'),
        content: TextField(
          controller: controller.search,
          decoration: const InputDecoration(hintText: 'Search Employee Here'),
        ),
        actions: [cancel, ok],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAlertDialog(context);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        initState: (_) => controller.getListUser(),
        builder: (control) {
          return control.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  child: control.user!.isEmpty
                      ? const Center(
                          child: Text('Employee Not Found'),
                        )
                      : ListView(
                          children: [
                            for (var data in control.user!)
                              UserWidget(
                                avatar: data.avatar,
                                email: data.email,
                                fname: data.firstName,
                                lname: data.lastName,
                                id: data.id,
                              )
                          ],
                        ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateUser());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
