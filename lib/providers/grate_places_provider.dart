import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:localtion_app/models/place_model.dart';

class GreatPlaceProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<PlaceModel> _items = [];

  List<PlaceModel> get items => [..._items];

  int get itemsCount => _items.length;

  PlaceModel itemByIndex(int index) => _items[index];

  void addPlace(String title, File image) {
    final newPlace = PlaceModel(
      id: Random().nextDouble().toString(),
      title: title,
      location: PlaceLocation(
        longitude: 0,
        latitude: 0,
        address: null,
      ),
      image: image,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
