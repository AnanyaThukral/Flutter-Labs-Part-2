import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/attraction_provider.dart';
import 'package:thukral_ananya_lab5_parta/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttractionProvider(),
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
