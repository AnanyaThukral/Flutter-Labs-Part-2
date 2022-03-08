import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<bool> filterClick = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @override
  Widget build(BuildContext context) {
    final List categories = [
      'Picnic',
      'Playground',
      'hiking',
      'Boating',
      'Ice-cream',
      'Tea',
      'Flowers',
      'Swimming',
      'Camping',
      'Education'
    ];
    final int length = categories.length;
    return Builder(builder: (context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return Container(
        width: height,
        // height: width,
        child: Wrap(spacing: 2, runSpacing: 2, children: [
          for (int i = 0; i < length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  filterClick[i] = !filterClick[i];
                });
              },
              child: Stack(
                children: [
                  Card(
                    color: filterClick[i] ? Colors.white : Color(0xffDCDCDC),
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(child: Text(categories[i]))),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: filterClick[i]
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 0.0,
                          )
                        : Icon(
                            Icons.check_circle_rounded,
                            size: 13,
                          ),
                  ),
                ],
              ),
            )
        ]),
      );
    });
  }
}
