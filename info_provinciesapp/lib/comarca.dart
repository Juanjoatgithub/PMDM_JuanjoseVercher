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

  factory Comarca.fromJSON(Map<String, dynamic> json) {
    return Comarca(
      comarca: json['comarca'] ?? 'Información no disponible',
      capital: json['capital'],
      poblacio: json['poblacio'],
      img: json['img'],
      desc: json['desc'],
      latitud: json['latitud']?.toDouble(),
      longitud: json['longitud']?.toDouble(),
      provincia: json['provincia'],
    );
  }

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
