//chave API do google clouds maps
const googleApikey = 'AIzaSyBc9yvE2W6ViYMmJRhSF2XT1e3Z1NQAGQc';

class LocationUtils {
  //metodo que gera uma imagem da localizao escolhida
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApikey';
  }
}
