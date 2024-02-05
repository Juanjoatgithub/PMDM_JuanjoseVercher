import 'package:flutter/material.dart';
import 'package:info_provinciesapp/model/infooratge.dart';
import 'info_comarca1.dart';
import 'package:info_provinciesapp/comarca.dart';
import 'package:info_provinciesapp/bloc/oratge_bloc.dart'; // Importa tu BLoC aquí

class InfoComarca2 extends StatelessWidget {
  final Comarca comarca;

  InfoComarca2({required this.comarca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oratge de la Comarca'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<InfoOratge?>(
          stream:
              OratgeBloc().obtenirInfoOratgeStream, // Obtén el stream del BLoC
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un indicador de carga si estamos esperando por los datos
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Maneja cualquier error que pueda ocurrir
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Construye la interfaz de usuario con la información recibida del stream
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 16.0),
                          Container(
                            color: Colors.white.withOpacity(0.7),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset(
                                  'assets/icons/soleado.png',
                                  height: 300,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.thermostat, color: Colors.black),
                                    SizedBox(width: 8.0),
                                    Text(
                                      '${snapshot.data?.temperatura ?? ''}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.waves, color: Colors.black),
                                    SizedBox(width: 8.0),
                                    Text(
                                      '${snapshot.data?.velocitatVent ?? ''}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.navigation, color: Colors.black),
                                    SizedBox(width: 8.0),
                                    Text(
                                      '${snapshot.data?.direccioVent ?? ''}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                // Puedes agregar más información aquí
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
                            builder: (context) =>
                                InfoComarca1(comarca: comarca),
                          ),
                        );
                      },
                      icon: Icon(Icons.info, color: Colors.black),
                      label: Text(
                        'Comarca',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
