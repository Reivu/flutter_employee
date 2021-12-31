import 'package:flutter/material.dart';
import 'package:flutter_employee/screen/details/detail_screen.dart';
import 'package:get/get.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
    required this.email,
    required this.fname,
    required this.lname,
    required this.avatar,
    required this.id,
  }) : super(key: key);
  final String email;
  final String fname;
  final String lname;
  final String avatar;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailScreen(id: id));
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Hero(
              tag: avatar,
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$fname $lname',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  email,
                  style: const TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
