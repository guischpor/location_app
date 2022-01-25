import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localtion_app/providers/great_places_provider.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';
import 'package:localtion_app/widgets/form/text_form_component.dart';
import 'package:localtion_app/widgets/image_input.dart';
import 'package:localtion_app/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlacesFormPage extends StatefulWidget {
  const PlacesFormPage({Key? key}) : super(key: key);

  @override
  State<PlacesFormPage> createState() => _PlacesFormPageState();
}

class _PlacesFormPageState extends State<PlacesFormPage> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;

    Provider.of<GreatPlaceProvider>(
      context,
      listen: false,
    ).addPlace(
      _titleController.text,
      _pickedImage!,
      _pickedPosition!,
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
        onPressed: _isValidForm() ? _submitForm : null,
        backgroundColor: _isValidForm() ? Colors.amber : Colors.grey,
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
            onChanged: (text) {
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          ImageInput(
            onSelectImage: _selectImage,
          ),
          const SizedBox(height: 15),
          LocationInput(
            onSelectPosition: _selectPosition,
          ),
        ],
      ),
    );
  }
}
