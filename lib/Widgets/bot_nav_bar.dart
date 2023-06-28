import 'package:flutter/material.dart';
import 'package:gass_in/Views/activities_page.dart';
import 'package:gass_in/Views/home_page.dart';
import 'package:gass_in/Views/payment_page.dart';
import 'package:gass_in/Views/profile_page.dart';
import 'package:gass_in/constant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final screen = [
    const HomePage(),
    const PaymentPage(),
    const ActivitiesPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), border: Border.all(color: underlineGreen)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                activeIcon: Column(
                  children: [
                    Image.asset(
                      "assets/icons/Home.png",
                      width: 35,
                    ),
                    Container(
                      width: 10,
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                icon: Image.asset(
                  "assets/icons/Home.png",
                  width: 35,
                ),
              ),
              BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      Image.asset(
                        "assets/icons/Payment.png",
                        width: 35,
                      ),
                      Container(
                        width: 10,
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  label: "Payment",
                  icon: Image.asset(
                    "assets/icons/Payment.png",
                    width: 40,
                  )),
              BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      Image.asset(
                        "assets/icons/Compass.png",
                        width: 35,
                      ),
                      Container(
                        width: 10,
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  label: "Activities",
                  icon: Image.asset(
                    "assets/icons/Compass.png",
                    width: 40,
                  )),
              BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      Image.asset(
                        "assets/icons/User.png",
                        width: 35,
                      ),
                      Container(
                        width: 10,
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  label: "Profile",
                  icon: Image.asset(
                    "assets/icons/User.png",
                    width: 40,
                  )),
            ],
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
        body: screen[index]);
  }
}
