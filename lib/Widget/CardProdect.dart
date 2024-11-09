import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:flutter/material.dart';

class CardProdect extends StatelessWidget {
  final String Img;
  final String name;
  final String price;
  final void Function() onTap;

  const CardProdect({super.key, required this.Img, required this.name, required this.price, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 200,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 0), blurRadius: 5),
      ], color: ColorsApp.white),
      child: Stack(
        children: [
          InkWell(
            onTap:onTap ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image.network(
                      width: 300,
                      Img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, color: ColorsApp.primary),
                    ),
                    Text(
                      price,
                      style:
                          const TextStyle(fontSize: 11, color: ColorsApp.gray),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Positioned(
              left: 0,
              child: InkWell(
                onTap: () {
                  // TODO Add to cart
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 0),
                            blurRadius: 10)
                      ],
                      border: Border.all(width: 3, color: ColorsApp.white),
                      borderRadius: BorderRadius.circular(200),
                      color: ColorsApp.primary),
                  child: const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: ColorsApp.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
