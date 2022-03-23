import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thukral_ananya_lab5_parta/attractions.dart';
import 'package:thukral_ananya_lab5_parta/modals/new_attarction.dart';
import 'package:thukral_ananya_lab5_parta/pages/attraction_page.dart';

class AttractionProvider extends ChangeNotifier {
  List<NewAttraction> _items = [];
  List<NewAttraction> _attractions = [];
  List<NewAttraction> attractions = [
    NewAttraction(
        title: 'Riverside Park',
        address: '709 Woolwich St, Guelph.',
        imageURL:
            'https://guelph.ca/wp-content/uploads/park_riverside_river.jpg',
        categories: [
          "Picnic",
          "Playground",
          "Hiking",
        ],
        description:
            'Riverside Park is a perfect location to host seasonable events. The Park offers the following: Floral Clock and Rock Gardens; a fully accessible children’s playground; an outdoor concert shell; an antique carousel; miniature train; horseshoe pits; a sand beach area; trails along the river front; 3 baseball diamonds; a scaled model of the first house built in Guelph by John Galt; and a large and small picnic shelter. A leash free zone located on the east side of the Speed River.'),
    NewAttraction(
        title: 'The Boathouse Tea Room',
        address: "116 Gordon St, Guelph",
        imageURL:
            "https://www.likealocalguide.com/media/cache/ee/4b/ee4be87780b1d213a51cb0f553cdff5d.jpg",
        categories: [
          'Boating',
          'Ice-Cream',
          'Tea',
        ],
        description:
            "Tea room and casual restaurant located in Guelph, Ontario. Perfect for breakfast or lunch. Canoe rentals located on the side of the Speed River."),
    NewAttraction(
        title: "University of Guelph Arboretum",
        address: "200 Arboretum Rd, Guelph",
        imageURL:
            "https://www.uoguelph.ca/arboretum/sites/uoguelph.ca.arboretum/files/public/cearley%20-%20eng%20garden%202008%20-%2032.JPG",
        categories: [
          "Hiking",
          "Flowers",
        ],
        description:
            "The Arboretum encompasses 400 acres adjacent to campus featuring plant collections, gardens, walking trails, natural woodlands, wetlands, and meadows. Established in 1970, The Arboretum is home to more than 2000 different taxa of woody plants, in thematic collections such as a synoptic World of Trees, Native Trees of Ontario, and noteworthy collections of Oaks, Beeches, Maples, and Conifers."),
    NewAttraction(
        title: "Guelph Lake Conservation Area",
        address: "7743 Conservation Rd, RR4, Guelph",
        imageURL:
            "https://images.squarespace-cdn.com/content/5a4e9da6d7bdce6edbcf105f/1530233801207-4I7GS1F8ZUW6GYS7VRIX/guelph-conservation-area-wedding-61.jpg?format=1500w&content-type=image%2Fjpeg",
        categories: ["Hiking", "Swimming", "Boating", "Camping"],
        description:
            "Large conservation & recreation area on a man-made reservoir with beaches & wooded hiking trails."),
    NewAttraction(
        title: "University of Guelph",
        address: "50 Stone Rd E, Guelph",
        imageURL:
            "https://housing.uoguelph.ca/sites/default/files/Johnston-Hall.jpg",
        categories: [
          "Education",
        ],
        description:
            "The University of Guelph is a comprehensive public research university in Guelph, Ontario, Canada. It was established in 1964 after the amalgamation of Ontario Agricultural College (1874), the MacDonald Institute (1903), and the Ontario Veterinary College (1922), and has since grown to an institution of almost 30,000 students (including those at the Humber campus, Ridgetown campus, off-campus degree enrolments, diploma enrolments and part-time students) and employs 830 full-time faculty (academic staff) as of fall 2019.")
  ];

  //add attraction fields to schedule page
  void addAttraction(NewAttraction item) {
    _items.add(item);
    notifyListeners();
    // This call tells the widgets that are listening to this model to rebuild.
  }

  //get the existing data of extractions
  List<NewAttraction> existingAttraction() {
    guelphAttractions.forEach((element) {
      _attractions.add(NewAttraction(
          title: element['title'],
          address: element['address'],
          imageURL: element['imageURL'],
          categories: element['categories'],
          description: element['description'],
          isFree: element['isFree']));
    });
    return _attractions;
  }

  //add attractions to main attractions screen
  void addMainAttraction(NewAttraction item) {
    _attractions.add(item);
    notifyListeners();
    // This call tells the widgets that are listening to this model to rebuild.
  }

  List<NewAttraction> get attract {
    return _attractions;
  }

  List<NewAttraction> get attract_test {
    if (attract.length < guelphAttractions.length) {
      return existingAttraction();
    } else {
      return _attractions;
    }
  }

  //getter - get the updated list
  List<NewAttraction> get basketitem {
    return _items;
  }

  // Removes all items from the cart
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
