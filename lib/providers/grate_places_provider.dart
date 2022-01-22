import 'package:flutter/material.dart';
import 'package:localtion_app/models/place_model.dart';

class GratePlaceProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<PlaceModel> _items = [];

  List<PlaceModel> get items => [..._items];

  int get itemsCount => _items.length;

  PlaceModel itemByIndex(int index) => _items[index];
}
