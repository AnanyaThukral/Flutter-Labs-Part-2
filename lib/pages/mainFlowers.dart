import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/pages/mainattraction_page.dart';
import 'package:thukral_ananya_lab5_parta/widgets/filter.dart';
import '../attractionfl.dart';
import '../attractionsIC.dart';
import 'attraction_schedule.dart';

class MainF extends StatefulWidget {
  const MainF({Key? key}) : super(key: key);

  @override
  State<MainF> createState() => _MyAppState();
}

bool contains = false;

class _MyAppState extends State<MainF> {
  //list to store categories after filtering
  List<String> updatedCategList = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                                Builder(builder: (context) {
                                  return TextButton(
                                    onPressed: () {
                                      // print(updatedCategList);
                                      updatedCategList = Filter.filterStore;
                                      // print(updatedCategList.length);
                                      Navigator.pop(context, 'Apply');

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainAttraction()));
                                      // print(updatedCategList);
                                      //clear the list after clicking on apply
                                      Filter.filterStore.clear();

                                      setState(() {
                                        updatedCategList = Filter.filterStore;
                                        contains = !contains;
                                        getBody(context, updatedCategList,
                                            contains);
                                      });
                                    },
                                    child: Text('Apply'),
                                  );
                                }),
                              ],
                            )));
                  });
            },
          )
        ],
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: contains
              ? getBody(context, updatedCategList, contains)
              : getBody(context, updatedCategList, contains)),
    );
  }

  Widget getBody(BuildContext context, List updatedCategList, bool contain) {
    List<String> categoryList = [];

    //extract all filtered categories in a list
    updatedCategList.forEach((element) {
      // print(element);
    });

    //extract all categories in a list
    guelphFl.forEach((item) {
      item['categories'].forEach((category) {
        categoryList.add(category);
      });
    });

    categoryList = categoryList.toSet().toList(); //remove duplicates
    // print(categoryList);
    // comapre filtered list list with all category list

    // if (categoryList.any((element) => updatedCategList.contains(element))) {

    //   print('YES MATCH');
    // } else {
    //   print('NO MATCH');
    // }
    List updateList = [];
    for (var el in categoryList) {
      bool isContains = updatedCategList.any((e) => el.contains(e));
      if (isContains && contain) {
        print('match');
        print(contain);
        updateList.add(el);
      } else {
        print(contain);
        print('no match');
      }
    }
    print(updateList);
    return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: guelphFl.length,
        itemBuilder: (context, index) {
          return GetCard(guelphFl[index], context);
        });
  }

  void checkFilter() {}
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
