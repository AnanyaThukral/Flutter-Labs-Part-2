import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/attraction_provider.dart';
import 'package:thukral_ananya_lab5_parta/modals/new_attarction.dart';
import 'package:thukral_ananya_lab5_parta/pages/mainattraction_page.dart';

class Attraction extends StatefulWidget {
  // final Function(NewAttraction) addAttract;

  Attraction({
    Key? key,
  }) : super(key: key);

  @override
  State<Attraction> createState() => _AttractionState();
}

class _AttractionState extends State<Attraction> {
  final _formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var addressController = TextEditingController();
  var imageURLController = TextEditingController();
  var priceController = TextEditingController();
  var categoriesController = TextEditingController();
  var descriptionController = TextEditingController();
  // var title;
  @override
  void dispose() {
    titleController.dispose();
    addressController.dispose();
    imageURLController.dispose();
    priceController.dispose();
    categoriesController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool isSwitched = false; //for toggle button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Attraction')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: 'Attraction Title',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: imageURLController,
                    decoration: InputDecoration(
                        labelText: 'Background Image',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: categoriesController,
                    decoration: InputDecoration(
                        labelText: 'Categories',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        "isFree",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<AttractionProvider>(
                          builder: ((context, value, child) {
                            return ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Attraction Added')),
                                  );

                                  //updated code
                                  Provider.of<AttractionProvider>(context,
                                          listen: false)
                                      .addMainAttraction(NewAttraction(
                                          title: titleController.text,
                                          address: addressController.text,
                                          imageURL: imageURLController.text,
                                          categories: categoriesController.text
                                              .toString()
                                              .split(","),
                                          description:
                                              descriptionController.text,
                                          isFree: isSwitched));

                                  //old method start
                                  // widget.addAttract(NewAttraction(
                                  //     title: titleController.text,
                                  //     address: addressController.text,
                                  //     imageURL: imageURLController.text,
                                  //     categories: categoriesController.text
                                  //         .toString()
                                  //         .split(","),
                                  //     description: descriptionController.text,
                                  //     isFree: isSwitched));
                                  //old method end

                                }
                              },
                              child: const Text('Create'),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
