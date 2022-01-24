import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({Key? key, required this.onSelectImage}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture({
    bool? gallery = false,
    bool? photo = false,
  }) async {
    // if (photo == true) {
      final _picker = ImagePicker();
      XFile imageFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      ) as XFile;

      if (imageFile == null) return;

      setState(() {
        _storedImage = File(imageFile.path);
      });
    // }

    // if (gallery == true) {
    //   final _picker = ImagePicker();
    //   XFile imageFile = await _picker.pickImage(
    //     source: ImageSource.gallery,
    //     maxWidth: 600,
    //   ) as XFile;

    //   if (imageFile == null) return;

    //   setState(() {
    //     _storedImage = File(imageFile.path);
    //   });
    // }

    //pega o diretorio que vamos guardar a imagem
    final appDir = await syspaths.getApplicationDocumentsDirectory();

    //Agora vamos pegar o nome da imagem
    String fileName = path.basename(_storedImage!.path);

    //Agora vamos salvar uma copia da imagem e salvar dentro do diretorio
    final savedImage = await _storedImage!.copy(
      '${appDir.path}/$fileName',
    );

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
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
          child: Column(
            children: [
              const SizedBox(width: 10),
              TextButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Tirar Foto'),
                onPressed: () => _takePicture(),
              ),
              // const SizedBox(width: 10),
              // TextButton.icon(
              //   icon: const Icon(Icons.sd_storage_rounded),
              //   label: const Text('Selecionar Imagem'),
              //   onPressed: () => _takePicture(gallery: true),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
