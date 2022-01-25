import 'package:flutter/material.dart';
import 'package:localtion_app/models/place_model.dart';
import 'package:localtion_app/pages/map_page.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlaceModel place = ModalRoute.of(context)?.settings.arguments as PlaceModel;

    return Scaffold(
      appBar: appBar(
        title: place.title,
        centerTitle: true,
      ),
      body: _body(context, place),
    );
  }

  Widget _body(BuildContext context, PlaceModel place) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(
            place.image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                '${place.location!.address}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        TextButton.icon(
          icon: const Icon(Icons.map),
          label: const Text('Ver no Mapa'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => MapPage(
                  isReadOnly: true,
                  initialLocation: place.location!,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
