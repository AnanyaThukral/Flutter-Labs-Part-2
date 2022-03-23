import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/pages/attraction_page.dart';
import 'package:thukral_ananya_lab5_parta/pages/home_page.dart';

import '../widgets/filter.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Home()));
        },
        child: Icon(Icons.add),
        elevation: 12,
      ),
      body: Center(child: Text('Schedule Page')),
    );
  }
}
