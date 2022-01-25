import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localtion_app/core/routes/app_routes.dart';
import 'package:localtion_app/core/utils/location_utils.dart';
import 'package:localtion_app/pages/map_page.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPosition;

  const LocationInput({
    Key? key,
    required this.onSelectPosition,
  }) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showPreview({
    required double lat,
    required double lng,
  }) {
    final staticMapImageUrl = LocationUtils.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locationData = await Location().getLocation();

      _showPreview(
        lat: locationData.latitude!,
        lng: locationData.longitude!,
      );

      widget.onSelectPosition(LatLng(
        locationData.latitude!,
        locationData.longitude!,
      ));
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const MapPage(),
      ),
    );

    if (selectedPosition == null) return;

    _showPreview(
      lat: selectedPosition.latitude,
      lng: selectedPosition.longitude,
    );

    widget.onSelectPosition(selectedPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  'Localização não informada!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton.icon(
                icon: const Icon(Icons.location_on),
                label: const Text('Localização Atual'),
                onPressed: _getCurrentUserLocation,
              ),
            ),
            Expanded(
              child: TextButton.icon(
                icon: const Icon(Icons.map),
                label: const Text('Selecione no Mapa'),
                onPressed: _selectOnMap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
