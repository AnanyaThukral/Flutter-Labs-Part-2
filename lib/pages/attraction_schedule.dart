import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/attraction_provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/new_attarction.dart';
import 'package:thukral_ananya_lab5_parta/pages/attraction_page.dart';
import 'package:thukral_ananya_lab5_parta/pages/mainFlowers.dart';
import 'package:thukral_ananya_lab5_parta/pages/schedule_add_page.dart';
import 'package:thukral_ananya_lab5_parta/pages/schedule_page.dart';

class ScheduleAttraction extends StatefulWidget {
  final String title;
  final List categories;
  final String description;
  final String address;
  final bool cost;
  final String img;
  final NewAttraction attraction; //added for provider

  const ScheduleAttraction(
      {Key? key,
      required this.title,
      required this.categories,
      required this.description,
      required this.address,
      required this.cost,
      required this.img,
      required this.attraction})
      : super(key: key);

  @override
  State<ScheduleAttraction> createState() => _ScheduleAttractionState();
}

class _ScheduleAttractionState extends State<ScheduleAttraction> {
  @override
  Widget build(BuildContext context) {
    final int length = widget.categories.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Attraction'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Hero(
                tag: 'attraction-img-${widget.img}',
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 27, 31),
                      image: DecorationImage(
                          image: NetworkImage(widget.img),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.dstATop))),
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    for (int i = 0; i < length; i++)
                      Card(
                        elevation: 1,
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            widget.categories[i].toString(),
                          ),
                        ),
                      ),
                  ]),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Description',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    widget.address,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Cost',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  widget.cost
                      ? Text(
                          'Free',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      : Text(
                          'Not Free',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                ],
              ),
              Consumer<AttractionProvider>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: () {
                      value.addAttraction(widget.attraction);
                    },
                    child: const Text('ADD'),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
