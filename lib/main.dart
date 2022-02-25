import 'package:flutter/material.dart';
import 'attractions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              },
            )
          ],
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: getBody()),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Attractions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Scheduled'),
        ], selectedItemColor: Colors.amber[800]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget getBody() {
    return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: guelphAttractions.length,
        itemBuilder: (context, index) {
          return GetCard(guelphAttractions[index]);
        });
  }
}

Widget GetCard(attractions) {
  bool isFree = attractions['isFree'];

  final int length = attractions['categories'].length;
  return Container(
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
          child: Image.network(
            attractions['imageURL'],
            fit: BoxFit.cover,
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
  );
}
