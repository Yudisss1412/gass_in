import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gass_in/Provider/auth_provider.dart';
import 'package:gass_in/Views/sign_up_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Models/account_model.dart';
import '../constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pickedFile;
  final ImagePicker _picker = ImagePicker();
  bool ispicked = false;
  @override
  Widget build(BuildContext context) {
    final dataImage = Provider.of<AuthProvider>(context, listen: false).getimageProfile;
    return Scaffold(
      appBar: AppBar(
        shadowColor: underlineGreen,
        elevation: 2,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: Row(
          children: [
            const SizedBox(
              width: 32,
            ),
            Image.asset("assets/icons/Polygon.png"),
            const SizedBox(
              width: 9,
            ),
            const Text(
              "Back",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
          ],
        ),
      ),

      //Streambuilder digunakan untuk memanggil data menggunakan method getData()
      body: StreamBuilder<List<AccountsModel>>(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              AccountsModel accountsModel = AccountsModel(name: "", email: "", password: "");

              //mengisi data menggunakan variabel accountsModel
              for (var element in data!) {
                accountsModel.name = element.name;
                accountsModel.email = element.email;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: InkWell(
                          onTap: () {

                            //memunculkan bottomSheet
                            _bottomSheet(context);
                          },

                          //apabila ispicked bernilai false, maka akan menampikan gambar default pada image asset
                          //apabila true, makan akan menampilkan gambar dari variabel dataImage yang sudah disimpan melalui camera atau gallery
                          child: ispicked
                              ? CircleAvatar(
                                  // radius: 80,
                                  backgroundImage: FileImage(dataImage!),
                                )
                              : const CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/profile.png"),
                                )),
                      title: Text(
                        accountsModel.name,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                      ),
                      subtitle: Text(
                        accountsModel.email,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/User.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Profile")
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/Compass.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Your Orders")
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_border),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Feedback")
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Container(height: 24, width: 24, decoration: const BoxDecoration(shape: BoxShape.circle), child: const Icon(Icons.question_mark)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Support")
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text("About")
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    InkWell(
                      onTap: () {

                        //digunakan untuk logout
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.power_settings_new),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Log Out")
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            //handling apabila data belum muncul akan menampilkan loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Container();
          }),
    );
  }

  Future<dynamic> _bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Choose Profile photo",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.camera),
                      onPressed: () async {

                        //variabel image akan menyimpan gambar dari kamera
                        //apabila image tidak null maka akan disimpan pada pickedFile lalu disimpan ke provider
                        //variabel ispicked menjadi true
                        final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                        if (image != null) {
                          pickedFile = File(image.path);
                          // ignore: use_build_context_synchronously
                          Provider.of<AuthProvider>(context, listen: false).saveImage(pickedFile!);
                        }
                        setState(() {
                          ispicked = true;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: () async {

                        //variabel image akan menyimpan gambar dari galeri
                        //apabila image tidak null maka akan disimpan pada pickedFile lalu disimpan ke provider
                        //variabel ispicked menjadi true
                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          pickedFile = File(image.path);
                          // ignore: use_build_context_synchronously
                          Provider.of<AuthProvider>(context, listen: false).saveImage(pickedFile!);
                        }
                        setState(() {
                          ispicked = true;
                        });
                      },
                    ),
                  ])
                ],
              ),
            ));
  }
}

//method getData() digunakan untuk mengambil data dari firebase dengan email yang sama dengan email yang digunakan untuk login
Stream<List<AccountsModel>> getData() => FirebaseFirestore.instance.collection("accounts").where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots().map((snapshots) => snapshots.docs.map((e) => AccountsModel.fromJson(e.data())).toList());
