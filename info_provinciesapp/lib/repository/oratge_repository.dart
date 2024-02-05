import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/infooratge.dart';

class OratgeRepository {
  Future<InfoOratge> obteClima(
      {required double latitud, required double longitud}) async {
    final String apiUrl = 'https://api.open-meteo.com/v1/forecast?';

    final response = await http.get(Uri.parse(
        '$apiUrl?latitude=$latitud&longitude=$longitud&current_wheather=true'));

    if (response.statusCode == 200) {
      // Analiza la respuesta JSON
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> current = data['current'];

      // Obtén los datos del clima actual
      String? temperatura = current['temperature'].toString();
      String? velocitatVent = current['windspeed'].toString();
      String? direccioVent = current['winddirection'].toString();
      String? codiOratge = current['weathercode'].toString();

      // Retorna una nueva instancia de InfoOratge con los datos obtenidos
      return InfoOratge(
        temperatura: temperatura,
        velocitatVent: velocitatVent,
        direccioVent: direccioVent,
        codiOratge: codiOratge,
      );
    } else {
      // Si la llamada a la API no es exitosa, lanza una excepción
      throw Exception('No se pudo obtener los datos del clima');
    }
  }
}
