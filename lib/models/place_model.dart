import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation {
  final double? latitude;
  final double? longitude;
  final String? address;

  const PlaceLocation({
    this.latitude,
    this.longitude,
    this.address,
  });

  LatLng toLatLng() {
    return LatLng(latitude!, longitude!);
  }
}

class PlaceModel {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  PlaceModel({
    required this.id,
    required this.title,
    this.location,
    required this.image,
  });
}
