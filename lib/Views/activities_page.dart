import 'package:flutter/material.dart';
import 'package:gass_in/Provider/driver_provider.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    //mengambil data dari provider dengan variable data
    final data = Provider.of<DriverProvider>(context, listen: false);
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

      //futurebuilder digunakan untuk menampilkan data yang sudah disimpan pada provider
      body: FutureBuilder(
        //data diambil dari method setAllUser yang ada pada provider
          future: data.setAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //menampilkan data menggunakan listview karena data berupa list
            return ListView.builder(
              itemCount: data.getusers.length,
              itemBuilder: (context, index) {
                //mengambil data tiap index
                final datauser = data.getusers[index];
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 9.6),
                  height: 97.42,
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    leading: Image.network(datauser.avatar!),
                    title: Text(
                      "${datauser.firstName!} ${datauser.lastName!}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Row(
                      children: [
                        Text("4.8", style: TextStyle(color: Colors.white)),
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFCE00),
                        )
                      ],
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Status", style: TextStyle(color: Colors.white)),
                          Text(
                            "Done",
                            style: TextStyle(color: Color(0xFF068C44), fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
