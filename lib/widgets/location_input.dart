import 'package:flutter/material.dart';
import 'package:localtion_app/core/utils/location_utils.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();

    final staticMapImageUrl = LocationUtils.generateLocationPreviewImage(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
