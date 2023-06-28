import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gass_in/Models/driver_model.dart';

class DriverProvider with ChangeNotifier {
  final dio = Dio();
  String url = "https://reqres.in/api/users";
  List<DriverModel> _users = [];
  List<DriverModel> get getusers => _users;

  //method setAllUser digunakan untuk mengambil data dari API lalu disimpan berupas list setelah dijadikan json
  Future<void> setAllUser() async {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      final List user = res.data["data"];
      _users = user.map((e) => DriverModel.fromJson(e)).toList();
    }
    notifyListeners();
  }
}