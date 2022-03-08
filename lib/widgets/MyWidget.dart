import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      return const Text('landscape');
    }
    return const Text('portrait!');
  }
}
