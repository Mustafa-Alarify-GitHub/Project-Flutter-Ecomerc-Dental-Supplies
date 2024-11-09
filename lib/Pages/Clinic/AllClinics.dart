import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:dental_supplies/Pages/Other/NoConnect.dart';
import 'package:dental_supplies/Widget/ButtonSearch.dart';
import 'package:dental_supplies/Widget/CardClinic.dart';
import 'package:dental_supplies/Widget/Loading.dart';
import 'package:flutter/material.dart';

import '../../Utils/Check internet.dart';

class AllClinics extends StatefulWidget {
  @override
  State<AllClinics> createState() => _AllClinicsState();
}

class _AllClinicsState extends State<AllClinics> {
  bool isConnectNet = true;
  bool isLoading = false;
  List<Map<String, String>> data = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeRNT2W7qFwPT6E-d964PtiHIWczi7Wtkh2Q&s",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwCY0uEP3aWt3pMQFPSVuFBpDN56uBke47zA&s",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/new-mixed-health-logo-or-hospital-logo-design-template-c9be22bc1de28c7e522c352bb2defcbd_screen.jpg?ts=1693128618",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://i.pinimg.com/736x/2e/02/bf/2e02bf2de46b5cbddf3cfbc16e83e822.jpg",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeRNT2W7qFwPT6E-d964PtiHIWczi7Wtkh2Q&s",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwCY0uEP3aWt3pMQFPSVuFBpDN56uBke47zA&s",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/new-mixed-health-logo-or-hospital-logo-design-template-c9be22bc1de28c7e522c352bb2defcbd_screen.jpg?ts=1693128618",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
    {
      "image":
          "https://i.pinimg.com/736x/2e/02/bf/2e02bf2de46b5cbddf3cfbc16e83e822.jpg",
      "name_user": "امجد الشهاري",
      "name_clinic": "hospital",
    },
  ];

  Future<void> _checkInternet() async {
    isConnectNet = await checkInternet();
    setState(() {});
  }

  @override
  void initState() {
    _checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("المزودين"),
      ),
      body: !isConnectNet
          ? NoConnect(
              onTap: () {
                _checkInternet();
              },
            )
          : isLoading
              ? Loading()
              : Column(
                  children: [
                    ButtonSearch(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: GridView.builder(
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return Cardclinic(
                                  id: 1,
                                  imgSrc: "${data[index]["image"]}",
                                  clinic: "${data[index]["name_clinic"]}",
                                  nameUser: "${data[index]["name_user"]}");
                            }),
                      ),
                    )
                  ],
                ),
    );
  }
}
