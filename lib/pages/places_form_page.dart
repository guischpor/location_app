import 'package:flutter/material.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';
import 'package:localtion_app/widgets/form/text_form_component.dart';
import 'package:localtion_app/widgets/image_input.dart';

class PlacesFormPage extends StatefulWidget {
  const PlacesFormPage({Key? key}) : super(key: key);

  @override
  State<PlacesFormPage> createState() => _PlacesFormPageState();
}

class _PlacesFormPageState extends State<PlacesFormPage> {
  final _titleController = TextEditingController();

  void _submitForm() {}

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
          const ImageInput(),
        ],
      ),
    );
  }
}
