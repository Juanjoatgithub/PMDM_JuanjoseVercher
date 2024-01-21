import 'dart:io';
import 'package:info_provinciesapp/comarca.dart';
import 'package:info_provinciesapp/peticions_http.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Siusplau, proporciona els arguments necessaris.');
    exit(1);
  }

  String? ordre;
  String? args;

  // Creem una còpia de la llista d'arguments del programa
  List<String> llistaArgs = List.from(arguments);

  // L'ordre és el primer argument
  ordre = llistaArgs[0];

  // Eliminem l'ordre
  llistaArgs.removeAt(0);

  // I reconstruim la resta d'arguments com un String,
  // separant-los amb un espai.
  args = llistaArgs.join(" ");

  switch (ordre) {
    case 'comarques':
      List<Comarca> comarques = await PeticionsHTTP.obtenirComarques(args);
      bool comarquesImpresses = false;
      for (Comarca comarca in comarques) {
        if (comarca.comarca != 'Información no disponible') {
          print('nom: ${comarca.comarca}');
          print('------------------------');
          comarquesImpresses = true;
        }
      }
      if (!comarquesImpresses) {
        print('No s\'han trobat comarques per a la província indicada.');
      }
      break;
    case 'infocomarca':
      Comarca comarca = await PeticionsHTTP.obtenirInfoComarca(args);
      print(comarca);
      break;
    default:
      print('Ordre no vàlida: $ordre');
      exit(1);
  }
}
