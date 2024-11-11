import 'package:dental_supplies/Utils/Api.dart';
import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:dental_supplies/Pages/Other/NoConnect.dart';
import 'package:dental_supplies/Utils/LinksApp.dart';
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
  bool isLoading = true;
  List data = [
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

  Future<void> GetAllDataForApi() async {
    await _checkInternet();
    isLoading = true;
    data.clear();

    var response = await Api.get(LinksApp.getAllClinic);
    if (response["status"] == "200") {
      data.addAll(response["data"]);
    }
    print(response);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetAllDataForApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("المزودين"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await GetAllDataForApi();
        },
        child: !isConnectNet
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
                                    clinic: "${data[index]["name_company"]}",
                                    nameUser: "${data[index]["name"]}");
                              }),
                        ),
                      )
                    ],
                  ),
      ),
    );
  }
}
