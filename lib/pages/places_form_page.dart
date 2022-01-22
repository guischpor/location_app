import 'package:flutter/material.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';

class PlacesFormPage extends StatefulWidget {
  const PlacesFormPage({Key? key}) : super(key: key);

  @override
  State<PlacesFormPage> createState() => _PlacesFormPageState();
}

class _PlacesFormPageState extends State<PlacesFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Adicionar Novo Lugar',
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
