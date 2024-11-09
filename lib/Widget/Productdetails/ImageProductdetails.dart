import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:flutter/material.dart';

class ImageProductdetails extends StatelessWidget {
  final String src;

  const ImageProductdetails({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  ColorsApp.white,
                  ColorsApp.gray,
                ], stops: [
                  0,
                  1
                ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
                child: Image.network(
                  src,
                  fit: BoxFit.fill,
                )),
            Positioned(
                left: 10,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    // TODO Add to cart
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 0),
                              blurRadius: 20)
                        ],
                        border: Border.all(width: 4, color: ColorsApp.white),
                        borderRadius: BorderRadius.circular(200),
                        color: ColorsApp.primary),
                    child: const Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: ColorsApp.white,
                      size: 35,
                    ),
                  ),
                )),
          ],
        ));
  }
}
