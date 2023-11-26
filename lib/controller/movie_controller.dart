import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/api_helper.dart';

class HomeController extends GetxController {
  List MovieList = [];
  TextEditingController txtmovie = TextEditingController();
  RxString movie = "all rise".obs;

  Future<List> callApi() async {
    MovieList = await ApiHelper.helper.Apicall() as List;
    return MovieList;
  }
}
