import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/widgets/filter.dart';
import '../attractions.dart';
import 'attraction_schedule.dart';

class MainAttraction extends StatefulWidget {
  const MainAttraction({Key? key}) : super(key: key);

  @override
  State<MainAttraction> createState() => _MyAppState();
}

class _MyAppState extends State<MainAttraction> {
  final List<String> categories = [
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
  List<String> selectedList = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Six - Ananya Thukral'),
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
                  builder: (context) {
                    return StatefulBuilder(
                        builder: ((context, setState) => AlertDialog(
                              title: Text('Adjust Filters'),
                              content: Filter(),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    //list storing the updated filters
                                    print(Filter.filterStore);

                                    Navigator.pop(context, 'Apply');
                                    //clear the list after clicking on apply
                                    Filter.filterStore.clear();
                                  },
                                  child: Text('Apply'),
                                ),
                              ],
                            )));
                  });
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

// void saveState(){
//   return
// }

}

Widget GetCard(attractions, BuildContext context) {
  bool isFree = attractions['isFree'];
  var landscape = MediaQuery.of(context).orientation == Orientation.landscape;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    width = height;
  } else {
    // height = width;
  }

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
    child: Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: landscape ? width : null,
        child: Card(
          elevation: 10,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
    ),
  );
}
