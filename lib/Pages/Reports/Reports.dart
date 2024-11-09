import 'package:dental_supplies/Pages/Other/EmpityData.dart';
import 'package:dental_supplies/Widget/Loading.dart';
import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  bool loading = false;
  List data = [
    {}
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: double.infinity,
          child:loading?const Loading():data.isEmpty?const EmpityData(): ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {return Container();})
    );
  }
}
