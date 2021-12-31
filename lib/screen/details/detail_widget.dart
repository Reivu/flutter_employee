import 'package:flutter/material.dart';

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 5,
          offset: const Offset(0, 2),
        )
      ]),
      child: Row(
        children: [
          const Icon(Icons.email),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                email,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Email',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
