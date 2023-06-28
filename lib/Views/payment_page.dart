import 'package:flutter/material.dart';
import 'package:gass_in/Widgets/field.dart';

import '../constant.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width, 53), backgroundColor: buttonGreen, textStyle: const TextStyle(color: Colors.white)),
          child: const Text("Add Payment"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Setup Payment Option",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              const SizedBox(
                height: 39.4,
              ),
              const Text("Card Number"),
              const SizedBox(
                height: 12,
              ),
              Field(textCenter: false, hintText: "", suffix: Image.asset("assets/icons/photocamera.png")),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Expiry Date"),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: 115.54,
                        decoration: BoxDecoration(color: grey1, borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: "MM/YY",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 21.9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("CVV"),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: 115.54,
                        decoration: BoxDecoration(color: grey1, borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 81,
                width: 96,
                decoration: BoxDecoration(
                  color: grey1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset("assets/icons/Paypal.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
