import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:localtion_app/core/data/db_places.dart';
import 'package:localtion_app/models/place_model.dart';

class GreatPlaceProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<PlaceModel> _items = [];

  List<PlaceModel> get items => [..._items];

  int get itemsCount => _items.length;

  PlaceModel itemByIndex(int index) => _items[index];

  Future<void> loadPlaces() async {
    final dataList = await DbPlaces.getData('places');

    _items = dataList
        .map((item) => PlaceModel(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: null,
            ))
        .toList();

    notifyListeners();
  }

  void addPlace(String title, File image) {
    final newPlace = PlaceModel(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );

    _items.add(newPlace);

    //salvando os dados do Db Places
    DbPlaces.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });

    notifyListeners();
  }
}
