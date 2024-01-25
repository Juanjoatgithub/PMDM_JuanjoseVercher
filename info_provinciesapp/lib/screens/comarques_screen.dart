import 'package:flutter/material.dart';
import 'package:info_provinciesapp/comarca.dart';
import 'package:info_provinciesapp/peticions_http.dart';
import 'package:info_provinciesapp/screens/info_comarca1.dart';

class ComarquesScreen extends StatelessWidget {
  final Map<String, dynamic> provincia;

  ComarquesScreen({required this.provincia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comarques de ${provincia['provincia']}'),
      ),
      body: FutureBuilder<List<Comarca>>(
        future: PeticionsHTTP.obtenirComarques(provincia['provincia']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print('Error en FutureBuilder: ${snapshot.error}');
            return Center(
              child: Text('Error al cargar las comarcas'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No se encontraron comarcas'),
            );
          } else {
            List<Comarca> comarcas = snapshot.data!;
            return ListView.builder(
              itemCount: comarcas.length,
              itemBuilder: (context, index) {
                var comarca = comarcas[index];
                print('Comarca: ${comarca.comarca}, Imagen: ${comarca.img}');
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoComarca1(comarca: comarca),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(comarca.img ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            comarca.comarca,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Lecker',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
