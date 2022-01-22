import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() async {
    final _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    if(imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  _takeGallery() async {
    final _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    ) as XFile;

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text(
                  'Nenhuma imagem\nanexada!',
                  textAlign: TextAlign.center,
                ),
        ),
        Expanded(
          child: Column(children: [
            const SizedBox(width: 10),
              TextButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Tirar Foto'),
                onPressed: _takePicture,
              ),
              // const SizedBox(width: 10),
              TextButton.icon(
                icon: const Icon(Icons.sd_storage_rounded),
                label: const Text('Selecionar Imagem'),
                onPressed: _takeGallery,
              ),
          ],),
        )
      ],
    );
  }
}
