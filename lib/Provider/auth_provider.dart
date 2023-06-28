
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gass_in/Models/account_model.dart';

class AuthProvider with ChangeNotifier{
  final AccountsModel _profile = AccountsModel(name: "", email: "", password: "");
  AccountsModel get getProfile => _profile;
  File? _imageProfile;
  File? get getimageProfile => _imageProfile;

  //digunakan untuk mengirim data ke firebase firestore
  Future<void> registerAccount(AccountsModel dataAccount) async {
    final docData = FirebaseFirestore.instance.collection("accounts").doc();
    dataAccount.id = docData.id;
    final json = dataAccount.toJson();
    docData.set(json);
    notifyListeners();
  }

  //digunakan untuk menyimpan gambar
  void saveImage(File image){
    _imageProfile = image;
    notifyListeners();
  }
}