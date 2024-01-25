import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'comarca.dart';

class PeticionsHTTP {
  static Future<List<Comarca>> obtenirComarques(String provincia) async {
    final uri = Uri.parse(
        'https://node-comarques-rest-server-production.up.railway.app/api/comarques/comarquesAmbImatge/$provincia');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print('Respuesta de la API: ${response.body}');

      List<dynamic> jsonComarques = json.decode(response.body);

      // Obtenemos nombres e imágenes de las comarcas
      List<Comarca> comarques = jsonComarques
          .map((json) => Comarca(
                comarca: json['nom'] ?? 'Información no disponible',
                img: json['img'] ?? '',
              ))
          .toList();

      return comarques;
    } else {
      print('Error en obtenir comarques: ${response.statusCode}');
      exit(1);
    }
  }

  static Future<Comarca> obtenirInfoComarca(String nomComarca) async {
    final uri = Uri.parse(
        'https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$nomComarca');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonComarca = json.decode(response.body);
      return Comarca.fromJSON(jsonComarca);
    } else {
      print('Error en obtenir info comarca: ${response.statusCode}');
      exit(1);
    }
  }

  static Future<List<dynamic>> obtenirProvincies() async {
    final uri = Uri.parse(
        'https://node-comarques-rest-server-production.up.railway.app/api/comarques');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Error en obtenir provincies: ${response.statusCode}');
      exit(1);
    }
  }

  static Future<dynamic> obteClima(
      {required double longitud, required double latitud}) async {
    final apiKey =
        'b29f9e5a21a2e32c39569f14c4885bcd'; // Reemplaza con tu clave de API
    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitud&lon=$longitud&appid=$apiKey&units=metric');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Error en obte clima: ${response.statusCode}');
      exit(1);
    }
  }
}
