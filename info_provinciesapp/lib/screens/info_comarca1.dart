import 'package:flutter/material.dart';
import 'info_comarca2.dart';

class InfoComarca1 extends StatelessWidget {
  final Map<String, dynamic> comarca;

  InfoComarca1({required this.comarca});

  @override
  Widget build(BuildContext context) {
    var coordlongitud = comarca['longitud'];
    var coordlatitud = comarca['latitud'];
    double? latitud = coordlatitud != null ? comarca['latitud'] : null;
    double? longitud = coordlongitud != null ? comarca['longitud'] : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la Comarca'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        comarca['img'],
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      color: Colors.white.withOpacity(0.7),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            comarca['comarca'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.black),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  'Capital: ${comarca['capital'] ?? 'No disponible'}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.group, color: Colors.black),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  'Población: ${comarca['poblacio'] ?? 'No disponible'}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.description, color: Colors.black),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  'Descripción: ${comarca['desc'] ?? 'No disponible'}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          if (latitud != null && longitud != null)
                            Row(
                              children: [
                                Icon(Icons.map, color: Colors.black),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    'Coordenadas: Latitud $latitud, Longitud $longitud',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (latitud == null || longitud == null)
                            Row(
                              children: [
                                Icon(Icons.map, color: Colors.black),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    'Coordenadas: No disponibles',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoComarca2(comarca: comarca),
                    ),
                  );
                },
                icon: Icon(Icons.wb_sunny, color: Colors.black),
                label: Text(
                  'Oratge',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
