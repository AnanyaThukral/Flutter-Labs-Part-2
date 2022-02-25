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

    var decoratedBox = DecoratedBox(
        decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(img),
      ),
    ));

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Hero(
                tag: 'attraction-img-$img',
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                )),
          ),
          Column(
            children: [
              Text(
                title,
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
              ),
              Column(
                children: [
                  Text('Description'),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [Text('Address'), Text(address)],
              ),
              Column(
                children: [
                  Text('Cost'),
                  cost ? Text('Free') : Text('Not Free')
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
