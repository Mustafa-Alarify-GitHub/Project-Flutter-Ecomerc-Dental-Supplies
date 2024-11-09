import 'package:dental_supplies/Utils/Check%20internet.dart';
import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:dental_supplies/Pages/Other/NoConnect.dart';
import 'package:dental_supplies/Pages/Product/ProdectDetails.dart';
import 'package:dental_supplies/Widget/ButtonShowCart.dart';
import 'package:dental_supplies/Widget/ButtonSearch.dart';
import 'package:dental_supplies/Widget/CardProdect.dart';
import 'package:dental_supplies/Widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Proudect extends StatefulWidget {
  final int id;
  final String name;
  final String img;

  const Proudect(
      {super.key, required this.id, required this.name, required this.img});

  @override
  State<Proudect> createState() => _ProudectState();
}

class _ProudectState extends State<Proudect> {
  bool isConnectNet = true;
  bool isLoading = false;
  List<Map<String, String>> data = [
    {
      "image":
          "https://media.zid.store/thumbs/edb8bc86-dd7d-4894-9c3d-86cee4057b51/2f6edcdf-a91b-4a19-9864-cfe77c71d366-thumbnail-1000x1000-70.jpeg",
      "price": "500",
      "name": "ملقاط",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGjNQDhVDfzvr89ryGXZ1JDIhflcN4i1WaRA&s",
      "price": "500",
      "name": "ملقاط",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqsriKFcPghAAr1Z_0exUiuai1DZTys-S6Ug&s",
      "price": "500",
      "name": "ملقاط",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRute7O50ACWBg0rc9vvls06ThhamG1bxMINw&s",
      "price": "500",
      "name": "ملقاط",
    },
  ];

  Future<void> _checkInternet() async {
    isConnectNet = await checkInternet();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonShowCart(),
      backgroundColor: ColorsApp.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${this.widget.name}"),
        actions: [
          widget.img.isNotEmpty ? Image.network(widget.img) : Container()
        ],
      ),
      body: !isConnectNet
          ? NoConnect(
              onTap: () {
                _checkInternet();
              },
            )
          : isLoading
              ? const Loading()
              : Column(
                  children: [
                    ButtonSearch(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: GridView.builder(
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: .7,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return CardProdect(
                                  onTap: () {
                                    Get.to(() => ProdectDetails(
                                          id: 1,
                                        ));
                                  },
                                  Img: "${data[index]["image"]}",
                                  name: "${data[index]["name"]}",
                                  price: "${data[index]["price"]}");
                            }),
                      ),
                    )
                  ],
                ),
    );
  }
}
