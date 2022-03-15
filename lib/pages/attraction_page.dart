import 'package:flutter/material.dart';
import 'package:thukral_ananya_lab5_parta/modals/new_attarction.dart';
import 'package:thukral_ananya_lab5_parta/pages/mainattraction_page.dart';

class Attraction extends StatefulWidget {
  final Function(NewAttraction) addAttract;
  const Attraction({Key? key, required this.addAttract}) : super(key: key);

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
    titleController.clear();
    addressController.clear();
    imageURLController.clear();
    priceController.clear();
    categoriesController.clear();
    descriptionController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Attraction')),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Attraction Title'),
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
                    decoration: InputDecoration(labelText: 'Background Image'),
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
                    decoration: InputDecoration(labelText: 'Categories'),
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
                    decoration: InputDecoration(labelText: 'Description'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  //toggle switch
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Attraction Added')),
                          );
                        }
                        widget.addAttract(
                          NewAttraction(
                              title: titleController.text,
                              address: addressController.text,
                              categories: categoriesController.text,
                              description: descriptionController.text,
                              imageURL: imageURLController.text),
                        );
                        print('added');
                      },
                      child: const Text('Create'),
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
