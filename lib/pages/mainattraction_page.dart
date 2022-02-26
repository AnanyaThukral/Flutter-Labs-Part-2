import 'package:flutter/material.dart';
import '../attractions.dart';
import 'attraction_schedule.dart';

class MainAttraction extends StatefulWidget {
  const MainAttraction({Key? key}) : super(key: key);

  @override
  State<MainAttraction> createState() => _MyAppState();
}

class _MyAppState extends State<MainAttraction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Five Part A - Ananya Thukral'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Adjust Filters'),
                  content: AllCategories(),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'Apply'),
                        child: Text('Apply'))
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: getBody(context)),
    );
  }

  Widget getBody(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: guelphAttractions.length,
        itemBuilder: (context, index) {
          return GetCard(guelphAttractions[index], context);
        });
  }
}

Widget AllCategories() {
  final List categories = [
    'Picnic',
    'Playground',
    'Hiking',
    'Boating',
    'Icecream',
    'Tea',
    'Flowers',
    'Swimming',
    'Camping',
    'Education'
  ];
  final int length = categories.length;
  return Wrap(children: [
    for (int i = 0; i < length; i++)
      Stack(
        children: [
          GestureDetector(
            onTap: () {
              //do something
            },
            child: Card(
              color: Color(0xffDCDCDC),
              child: Padding(
                  padding: EdgeInsets.all(5), child: Text(categories[i])),
            ),
          )
        ],
      )
  ]);
}

Widget GetCard(attractions, BuildContext context) {
  bool isFree = attractions['isFree'];

  final int length = attractions['categories'].length;
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScheduleAttraction(
              title: attractions['title'],
              categories: attractions['categories'],
              description: attractions['description'],
              address: attractions['address'],
              cost: attractions['isFree'],
              img: attractions['imageURL'])));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 305,
      child: Card(
        elevation: 10,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            attractions['title'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 350,
            height: 210,
            child: Hero(
              tag: 'attraction-img-${attractions['imageURL']}', //unique image
              child: Image.network(
                attractions['imageURL'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int i = 0; i < length; i++)
              Card(
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    attractions['categories'][i],
                  ),
                ),
              ),
          ]),
          Text(attractions['address']),
          isFree ? Icon(Icons.money_off) : Icon(Icons.attach_money)
        ]),
      ),
    ),
  );
}
