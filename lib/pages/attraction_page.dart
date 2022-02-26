import 'package:flutter/material.dart';

class Attraction extends StatelessWidget {
  const Attraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attraction'),
      ),
      body: Center(child: Text('Add Attraction')),
    );
  }
}
