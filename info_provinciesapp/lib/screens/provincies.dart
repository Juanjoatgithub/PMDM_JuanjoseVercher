import 'package:flutter/material.dart';
import 'package:info_provinciesapp/data/comarques.dart';
import 'package:info_provinciesapp/screens/comarques_screen.dart';
// Asegúrate de que la ruta sea correcta

class ProvinciesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selector de provincies'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var provincia in provincies)
                CircularImageTile(
                  provincia: provincia,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComarquesScreen(
                          provincia: provincia,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularImageTile extends StatelessWidget {
  final Map<String, dynamic> provincia;
  final VoidCallback onTap;

  CircularImageTile({required this.provincia, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(provincia['img']),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(75),
                child: Text(
                  provincia['provincia'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Lecker',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
