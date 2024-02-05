import 'dart:async';
import 'package:info_provinciesapp/comarca.dart';
import '../repository/oratge_repository.dart';
import '../model/infooratge.dart';

class OratgeBloc {
  final OratgeRepository _oratgeRepository = OratgeRepository();

  Comarca? comarcaActual;

  InfoOratge? infoOratge;

  final StreamController<InfoOratge?> _infoOratgeController =
      StreamController<InfoOratge?>.broadcast();
  Stream<InfoOratge?> get obtenirInfoOratgeStream =>
      _infoOratgeController.stream;

  // Singleton
  static final OratgeBloc _instance = OratgeBloc._();
  factory OratgeBloc() {
    return _instance;
  }
  OratgeBloc._();

  void setComarcaActual(Comarca? comarca) {
    if (comarca != null && comarcaActual != comarca) {
      comarcaActual = comarca;
      carregaOratge(comarca);
    }
  }

  void carregaOratge(Comarca comarca) async {
    if (comarca.latitud != null && comarca.longitud != null) {
      InfoOratge nouOratge = await _oratgeRepository.obteClima(
          latitud: comarca.latitud!, longitud: comarca.longitud!);
      infoOratge = nouOratge;
      _infoOratgeController.sink.add(infoOratge);
    }
  }

  void actualitzaOratge() async {
    // Simplement actualitza l'oratge emetent la informació actual
    _infoOratgeController.sink.add(infoOratge);
  }

  void dispose() {
    _infoOratgeController.close();
  }
}
