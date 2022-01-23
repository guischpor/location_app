import 'package:flutter/material.dart';
import 'package:localtion_app/core/routes/app_routes.dart';
import 'package:localtion_app/providers/grate_places_provider.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Meus Lugares',
        centerTitle: true,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.placeFormPage,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Consumer<GreatPlaceProvider>(
      child: const Center(
        child: Text('Nenhum local cadastrado!'),
      ),
      builder: (context, greatPlaces, child) => greatPlaces.itemsCount == 0
          ? child!
          : ListView.builder(
              itemCount: greatPlaces.itemsCount,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    greatPlaces.itemByIndex(index).image,
                  ),
                ),
                title: Text(
                  greatPlaces.itemByIndex(index).title,
                ),
                onTap: () {},
              ),
            ),
    );
  }
}
