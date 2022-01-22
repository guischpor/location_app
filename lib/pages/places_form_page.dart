import 'package:flutter/material.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';

class PlacesFormPage extends StatelessWidget {
  const PlacesFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Adicionar Lugares',
        centerTitle: true,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return const Center(
      child: Text('Tela'),
    );
  }
}
