import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:dental_supplies/Widget/ButtonShowCart.dart';
import 'package:dental_supplies/Widget/CardProdect.dart';
import 'package:dental_supplies/Widget/Productdetails/ImageProductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdectDetails extends StatefulWidget {
  final int id;

  const ProdectDetails({super.key, required this.id});

  @override
  State<ProdectDetails> createState() => _ProdectDetailsState();
}

class _ProdectDetailsState extends State<ProdectDetails> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("ملقاط"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonShowCart(),
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageProductdetails(
                  src:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRute7O50ACWBg0rc9vvls06ThhamG1bxMINw&s"),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.gray, width: 2),
                    color: ColorsApp.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 20)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ملقاط",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      """مكونات كرسي الأسنان
                            الهيكل الرئيسي: عادة ما يكون مصنوعًا من الفولاذ المقاوم للصدأ أو الألومنيوم لضمان المتانة والقابلية للتعقيم
                            المقعد: قابل للتعديل في الارتفاع والزاوية، ويتكون من مواد ناعمة ومريحة لتوفير الراحة للمريض
                            مسند الظهر: قابل للتعديل أيضًا، ويتيح للمريض الاسترخاء في وضعية مريحة""",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.gray, width: 2),
                    color: ColorsApp.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 20)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "السعر",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "500",
                      style: const TextStyle(
                          fontSize: 20,
                          color: ColorsApp.gray,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.gray, width: 2),
                    color: ColorsApp.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 20)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "نوع القطعة ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "الماني",
                      style: const TextStyle(
                          fontSize: 20,
                          color: ColorsApp.gray,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "منتجات مشابهة",
                      style: TextStyle(color: ColorsApp.gray),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "مشاهدة الكل >",
                        style: TextStyle(color: ColorsApp.primary),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: .7,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return CardProdect(
                        onTap: () {},
                        Img: "${data[index]["image"]}",
                        name: "${data[index]["name"]}",
                        price: "${data[index]["price"]}");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
