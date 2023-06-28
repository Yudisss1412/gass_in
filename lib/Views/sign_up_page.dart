import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gass_in/Models/account_model.dart';
import 'package:gass_in/Views/sign_in_page.dart';
import 'package:gass_in/constant.dart';
import 'package:provider/provider.dart';

import '../Provider/auth_provider.dart';
import '../Widgets/bot_nav_bar.dart';
import '../Widgets/field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  //formkey untuk validasi field
  final formKey = GlobalKey<FormState>();
  //controller untuk menyimpan text dari field
  final TextEditingController controlEmail = TextEditingController();
  final TextEditingController controlPass = TextEditingController();
  final TextEditingController controlName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 66,
                ),
                Image.asset("assets/images/cycle.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome to",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24, color: Color(0xFF747683)),
                ),
                const Text.rich(
                  TextSpan(text: "Gass", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 64), children: [
                    TextSpan(
                      text: "IN",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 64),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 90,
                ),
                const Text("Full Name"),
                const SizedBox(
                  height: 17,
                ),

                //field merupakan custom widget
                Field(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("please fill field");
                    } else {
                      return null;
                    }
                  },
                  controller: controlName,
                  hintText: "John Mylde",
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Text("Email Address"),
                const SizedBox(
                  height: 17,
                ),
                Field(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("please fill field");
                    } else {
                      return null;
                    }
                  },
                  controller: controlEmail,
                  hintText: "username@gmail.com",
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 17,
                ),
                Field(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("please fill field");
                    } else {
                      return null;
                    }
                  },
                  controller: controlPass,
                  isPassword: true,
                  hintText: "password",
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Text("Confirm Password"),
                const SizedBox(
                  height: 17,
                ),
                Field(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("please fill field");
                    } else if (value != controlPass.text) {
                      return ("password confirmation does not match");
                    } else {
                      return null;
                    }
                  },
                  isPassword: true,
                  hintText: "confirm password",
                ),
                const SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                    onPressed: () async {

                      //digunakan untuk cek validasi
                      if (formKey.currentState!.validate()) {
                        try {
                          //data sebagai variabel untuk menyimpan data yang ada pada field menggunakan model
                          final data = AccountsModel(name: controlName.text, email: controlEmail.text, password: controlPass.text);

                          //Provider digunakan untuk menyimpan data
                          Provider.of<AuthProvider>(context, listen: false).registerAccount(data);

                          //FirebaseAuth digunakan untuk membuat user berdasarkan email dan password yang sudah diinputkan
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: controlEmail.text, password: controlPass.text).then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavBar(),
                              )));
                        } on FirebaseAuthException catch (e) {

                          //apabila error, akan memunculkan snackbar yang memiliki pesan error
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.message!),
                            duration: const Duration(seconds: 5),
                            action: SnackBarAction(
                                label: "Dismiss",
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                }),
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width, 53), backgroundColor: buttonGreen, textStyle: const TextStyle(color: Colors.white)),
                    child: const Text("Sign Up")),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Divider(
                      color: grey2,
                    )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 17),
                        child: const Text(
                          "or",
                          style: TextStyle(fontWeight: FontWeight.w500, color: grey2),
                        )),
                    const Expanded(
                        child: Divider(
                      color: grey2,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF747683))),
                  height: 53,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/google.png"),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("Continue with Google"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text.rich(
                  TextSpan(text: "Already have an account? ", children: [
                    TextSpan(
                        text: "Sign In",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          })
                  ]),
                ),
                const SizedBox(
                  height: 67,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
