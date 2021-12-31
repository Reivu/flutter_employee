import 'package:flutter/material.dart';
import 'package:flutter_employee/controller/detail_controller.dart';
import 'package:flutter_employee/screen/details/detail_widget.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;
  final DetailController controller = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: .0,
      ),
      body: GetBuilder<DetailController>(
        initState: (_) => controller.getDetail(id: id),
        builder: (val) {
          return val.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    //Atau bisa pakai Stack
                    Hero(
                      tag: val.user.avatar,
                      child: Container(
                        width: double.infinity,
                        height: size.height * .5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(val.user.avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: const Alignment(.0, .75),
                          child: Text(
                            '${val.user.firstName} ${val.user.lastName}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    UserDetailWidget(
                      email: val.user.email,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
