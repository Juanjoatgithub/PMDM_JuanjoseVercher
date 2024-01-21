class Comarca {
  String comarca;
  String? capital;
  String? poblacio;
  String? img;
  String? desc;
  double? latitud;
  double? longitud;
  String? provincia;

  Comarca({
    required this.comarca,
    this.capital,
    this.poblacio,
    this.img,
    this.desc,
    this.latitud,
    this.longitud,
    this.provincia,
  });

  Comarca.fromJSON(Map<String, dynamic>? json)
      : comarca = json?['comarca'] ?? 'Información no disponible',
        capital = json?['capital'] ?? 'Información no disponible',
        poblacio = json?['poblacio'] ?? 'Información no disponible',
        img = json?['img'] ?? 'https://via.placeholder.com/150',
        desc = json?['desc'] ?? 'Información no disponible',
        latitud = json?['latitud']?.toDouble() ?? 0.0,
        longitud = json?['longitud']?.toDouble() ?? 0.0,
        provincia = json?['provincia'];

  ProvinciaInfo toProvinciaInfo() {
    return ProvinciaInfo(nom: provincia ?? "", img: img ?? "");
  }

  @override
  String toString() {
    return '''
    Comarca:        $comarca
    Capital:        $capital
    Población:      $poblacio
    Imagen:         $img
    Descripción:    $desc
    Coordenadas:    ($latitud, $longitud)
    Provincia:      $provincia
    ''';
  }
}

class ProvinciaInfo {
  final String nom;
  final String img;

  ProvinciaInfo({required this.nom, required this.img});
}
