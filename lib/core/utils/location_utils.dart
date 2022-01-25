//chave API do google clouds maps
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const googleApikey = 'AIzaSyBc9yvE2W6ViYMmJRhSF2XT1e3Z1NQAGQc';

class LocationUtils {
  //metodo que gera uma imagem da localizao escolhida
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApikey';
  }

  //metodo que representa e retorna o endereço
  static Future<dynamic> getAddressFrom(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApikey');
    final response = await http.get(url);

    Map<String, dynamic> dados = json.decode(response.body);
    print('Dados: ${dados}');
    return dados['results'][0]['formatted_address'].toString();
  }
}
