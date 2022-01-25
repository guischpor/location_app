import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localtion_app/models/place_model.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';

class MapPage extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapPage({
    Key? key,
    this.initialLocation = const PlaceLocation(
      latitude: 37.419857,
      longitude: -122.078827,
    ),
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Local no Mapa',
        centerTitle: true,
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _pickedPosition == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedPosition);
                    },
            ),
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.initialLocation.latitude!,
          widget.initialLocation.longitude!,
        ),
        zoom: 13,
      ),
      onTap: widget.isReadOnly ? null : _selectPosition,
      markers: (_pickedPosition == null && !widget.isReadOnly)
          ? Set()
          : {
              Marker(
                markerId: const MarkerId('p1'),
                position: _pickedPosition ?? widget.initialLocation.toLatLng(),
              ),
            },
    );
  }
}
