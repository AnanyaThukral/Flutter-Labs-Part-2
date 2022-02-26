import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/pages/mainattraction_page.dart';
import 'package:thukral_ananya_lab5_parta/pages/schedule_page.dart';

import 'attraction_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  int selectedPage = 0;

  final _pageOptions = [MainAttraction(), SchedulePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Attractions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Scheduled'),
          ],
          selectedItemColor: Colors.amber[800],
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Attraction()));
        },
        child: Icon(Icons.add),
        elevation: 12,
      ),
    );
  }
}
