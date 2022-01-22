import 'package:flutter/material.dart';
import 'package:localtion_app/core/routes/app_routes.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';

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
    return const Center(
      child: Text('Tela'),
    );
  }
}
