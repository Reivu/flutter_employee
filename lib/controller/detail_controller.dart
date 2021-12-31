import 'package:flutter_employee/services/fetch_data.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var user;
  bool isLoading = false;

  void getDetail({int? id}) async {
    isLoading = true;
    var res = await FetchData.getUserDetail(id: id);
    user = res.data;
    isLoading = false;
    update();
  }
}
