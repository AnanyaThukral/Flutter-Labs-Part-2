import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/attractions.dart';
import 'package:thukral_ananya_lab5_parta/main.dart';

class ScheduleAttraction extends StatelessWidget {
  final String title;
  final List categories;
  final String description;
  final String address;
  final bool cost;
  final String img;

  const ScheduleAttraction(
      {Key? key,
      required this.title,
      required this.categories,
      required this.description,
      required this.address,
      required this.cost,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int length = categories.length;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Hero(
                tag: 'attraction-img-$img',
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 27, 31),
                      image: DecorationImage(
                          image: NetworkImage(img),
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
                title,
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
                            categories[i].toString(),
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
                    description,
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
                    address,
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
                  cost
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
              ElevatedButton(onPressed: () {}, child: Text('Add')),
            ],
          )
        ],
      ),
    );
  }
}
