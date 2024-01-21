// comarques_screen.dart
import 'package:flutter/material.dart';
import 'package:info_provinciesapp/screens/info_comarca1.dart'; // Asegúrate de importar el archivo correcto

class ComarquesScreen extends StatelessWidget {
  final Map<String, dynamic> provincia;

  ComarquesScreen({required this.provincia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comarques de ${provincia['provincia']}'),
      ),
      body: ListView.builder(
        itemCount: provincia['comarques'].length,
        itemBuilder: (context, index) {
          var comarca = provincia['comarques'][index];
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
                  height: 200, // Set the desired height
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(comarca['img']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      comarca['comarca'] ?? '',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Lecker'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
