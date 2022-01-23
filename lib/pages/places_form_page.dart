import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localtion_app/providers/grate_places_provider.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';
import 'package:localtion_app/widgets/form/text_form_component.dart';
import 'package:localtion_app/widgets/image_input.dart';
import 'package:provider/provider.dart';

class PlacesFormPage extends StatefulWidget {
  const PlacesFormPage({Key? key}) : super(key: key);

  @override
  State<PlacesFormPage> createState() => _PlacesFormPageState();
}

class _PlacesFormPageState extends State<PlacesFormPage> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaceProvider>(
      context,
      listen: false,
    ).addPlace(
      _titleController.text,
      _pickedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Adicionar Novo Lugar',
        centerTitle: true,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _submitForm(),
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: _form(context),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormComponent(
            labelText: 'Título',
            keyboardType: TextInputType.name,
            controller: _titleController,
          ),
          const SizedBox(height: 15),
          ImageInput(
            onSelectImage: _selectImage,
          ),
        ],
      ),
    );
  }
}
