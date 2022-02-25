import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/attractions.dart';
import 'package:thukral_ananya_lab5_parta/main.dart';

class ScheduleAttraction extends StatelessWidget {
  final String title;
  final List categories;
  // final String description;
  // final String address;
  // final bool cost;

  const ScheduleAttraction(
      {Key? key, required this.title, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int length = categories.length;
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        Column(
          children: [
            Text('Categories'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int i = 0; i < length; i++)
                Card(
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      categories[i].toString(),
                    ),
                  ),
                ),
            ]),
          ],
        )
      ]),
      backgroundColor: Colors.black,
    );
  }
}
