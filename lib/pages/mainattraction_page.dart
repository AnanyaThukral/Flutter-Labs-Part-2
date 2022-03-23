import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/attraction_provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/new_attarction.dart';
import 'package:thukral_ananya_lab5_parta/pages/attraction_page.dart';
import 'package:thukral_ananya_lab5_parta/pages/mainIC.dart';
import 'package:thukral_ananya_lab5_parta/widgets/filter.dart';
import '../attractions.dart';
import 'attraction_schedule.dart';

class MainAttraction extends StatefulWidget {
  const MainAttraction({Key? key}) : super(key: key);

  @override
  State<MainAttraction> createState() => _MyAppState();
}

class _MyAppState extends State<MainAttraction> {
  //list to store categories after filtering
  List<String> updatedCategList = [];
  List<bool> updatedCategBool = [];
  // bool contains = false;
  List<NewAttraction> attraction_list = [];

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   guelphAttractions.forEach((element) {
  //     attraction_list.add(NewAttraction(
  //         title: element['title'],
  //         address: element['address'],
  //         imageURL: element['imageURL'],
  //         categories: element['categories'],
  //         description: element['description'],
  //         isFree: element['isFree']));
  //   });
  // }

  // void addAttraction(NewAttraction attraction) {
  //   setState(() {
  //     attraction_list.add(attraction);
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Lab Seven - Ananya Thukral'),
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
                                    onPressed: () async {
                                      updatedCategList = Filter.filterStore;
                                      updatedCategBool = Filter.filterClick;
                                      Navigator.pop(context, 'Apply');
                                      // print(updatedCategList);
                                      // print(updatedCategBool);
                                      if (updatedCategList.join() ==
                                          'Ice-Cream') {
                                        // print(updatedCategList);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainIC()));
                                      } else if (updatedCategList.join() ==
                                          'Flowers') {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainIC()));
                                      } else {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainIC()));
                                      }

                                      //clear the list after clicking on apply
                                      Filter.filterStore.clear();
                                      // Filter.filterClick.clear();

                                      setState(() {
                                        contains = !contains;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //old method
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => Attraction(
          //           addAttract: addAttraction,
          //         )));

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Attraction();
          }));
        },
        child: Icon(Icons.add),
        elevation: 12,
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: getBody(context)),
    );
  }

  Widget getBody(BuildContext context) {
    return Consumer<AttractionProvider>(builder: ((context, value, child) {
      return ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: value.attract_test.length,
          itemBuilder: (context, index) {
            return GetCard(value.attract_test[index], context);
          });
    }));
  }
}

Widget GetCard(attractions, BuildContext context) {
  bool isFree = attractions.isFree;
  // bool isFree = false;
  var landscape = MediaQuery.of(context).orientation == Orientation.landscape;
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    width = height;
  } else {
    // height = width;
  }

  final int length = attractions.categories.length;
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScheduleAttraction(
                title: attractions.title,
                categories: attractions.categories,
                description: attractions.description,
                address: attractions.address,
                cost: attractions.isFree,
                img: attractions.imageURL,
                attraction: attractions,
              )));
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
              attractions.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 350,
              height: 210,
              child: Hero(
                tag: 'attraction-img-${attractions.imageURL}', //unique image
                child: Image.network(
                  attractions.imageURL,
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
                      attractions.categories[i],
                    ),
                  ),
                ),
            ]),
            Text(attractions.address),
            isFree ? Icon(Icons.money_off) : Icon(Icons.attach_money)
          ]),
        ),
      ),
    ),
  );
}
