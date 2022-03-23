import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/modals/attraction_provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/new_attarction.dart';
import 'package:provider/provider.dart';

import '../widgets/filter.dart';

class ScheduleAdd extends StatefulWidget {
  @override
  State<ScheduleAdd> createState() => _ScheduleAddState();
}

class _ScheduleAddState extends State<ScheduleAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lab Seven'),
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
                                content: Filter(
                                    // filterStore: ['categories']
                                    ),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Apply'),
                                      child: Text('Apply')),
                                ],
                              )));
                    });
              },
            )
          ],
        ),
        body: Consumer<AttractionProvider>(builder: (context, value, child) {
          return value.basketitem.isEmpty
              ? Center(
                  child: Text(
                    "No Attractions Scheduled",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              : ListView.builder(
                  itemCount: value.basketitem.length,
                  itemBuilder: (context, index) {
                    return (ListTile(
                      title: Text("${value.basketitem[index].title}"),
                      subtitle: Text("${value.basketitem[index].address}"),
                    ));
                  },
                );
        }));
  }
}
