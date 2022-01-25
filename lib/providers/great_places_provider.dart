import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localtion_app/core/data/db_places.dart';
import 'package:localtion_app/core/utils/location_utils.dart';
import 'package:localtion_app/models/place_model.dart';

class GreatPlaceProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbPlaces.getData('places');
    _items = dataList
        .map(
          (item) => PlaceModel(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['latitude'],
              longitude: item['longitude'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }

  List<PlaceModel> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  PlaceModel itemByIndex(int index) {
    return _items[index];
  }

  Future<void> addPlace(
    String title,
    File image,
    LatLng position,
  ) async {
    String address = await LocationUtils.getAddressFrom(position);

    final newPlace = PlaceModel(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );

    _items.add(newPlace);
    DbPlaces.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': address,
    });
    notifyListeners();
  }
}
