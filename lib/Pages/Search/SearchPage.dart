import 'package:dental_supplies/Utils/ColorsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 1, color: ColorsApp.gray)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: ColorsApp.gray,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 2,
                              height: 40,
                              color: ColorsApp.gray,
                            ),
                            const Icon(
                              Icons.search,
                              size: 40,
                              color: ColorsApp.gray,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                              autofocus: true,
                              controller: txtSearch,
                              decoration: const InputDecoration(
                                hintText: "ابــحــثــ عــنــ مــنــتــجــ...",
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 50,
                          color: ColorsApp.primary,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
