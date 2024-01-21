import 'package:flutter/material.dart';

class InfoComarca2 extends StatelessWidget {
  final Map<String, dynamic> comarca;

  InfoComarca2({required this.comarca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oratge de la comarca'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Información de la Comarca 2',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                color: Colors.white.withOpacity(0.7),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    // Mostrar una imagen centrada desde una carpeta local
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/icons/soleado.png', // Usar barras inclinadas
                        height: 200, // Ajusta la altura según tus necesidades
                        width: 200, // Ajusta el ancho según tus necesidades
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Volver a la pantalla anterior
                    },
                    icon: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Comarca',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Fondo del botón
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15), // Ajusta el padding
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
