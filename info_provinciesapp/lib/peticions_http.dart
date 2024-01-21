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
      List<dynamic> jsonComarques = json.decode(response.body);

      // Solo obtenemos los nombres de las comarcas
      List<Comarca> comarques = jsonComarques
          .map((json) =>
              Comarca(comarca: json['nom'] ?? 'Información no disponible'))
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
}
