import 'package:flutter/material.dart';
import 'package:gass_in/maps.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 63,
            ),
            const Text(
              "Hi",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "User!",
              style: TextStyle(fontSize: 64, color: Color(0xFFCBCBCB), fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "What are you sending today ?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 18,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFCBCBCB)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Pizza.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Food Delivery",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "(less than 10kg)",
                          style: TextStyle(fontSize: 11, color: Color(0xFF079A4B)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFCBCBCB)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Package.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Parcel",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "(less than 10kg)",
                          style: TextStyle(fontSize: 11, color: Color(0xFF079A4B)),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MapPage();
                                      }));
                                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFCBCBCB)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/shopping.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Groceries",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "(less than 10kg)",
                            style: TextStyle(fontSize: 11, color: Color(0xFF079A4B)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
