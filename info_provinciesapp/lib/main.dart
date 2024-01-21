import 'package:flutter/material.dart';
import 'package:info_provinciesapp/comarca.dart';
import 'package:info_provinciesapp/peticions_http.dart';
import 'package:info_provinciesapp/screens/login.dart';
import 'package:info_provinciesapp/screens/provincies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(
        onLoginPressed: () {
          Navigator.pushReplacementNamed(context, '/provincies');
        },
      ),
      routes: {
        '/provincies': (context) => ProvinciesScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String orden = '';
  String args = '';
  List<Comarca> comarques = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Provincias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Orden: $orden',
            ),
            Text(
              'Args: $args',
            ),
            ElevatedButton(
              onPressed: () async {
                await _obtenerComarques();
              },
              child: Text('Obtener Comarques'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _obtenerInfoComarca();
              },
              child: Text('Obtener Info Comarca'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/provincies');
              },
              child: Text('Ir a la Pantalla de Provincias'),
            ),
            if (comarques.isNotEmpty) ..._buildComarcasWidgets(),
          ],
        ),
      ),
    );
  }

  Future<void> _obtenerComarques() async {
    try {
      setState(() {
        orden = 'comarques';
        args = 'tus argumentos aquí';
      });
      comarques = await PeticionsHTTP.obtenirComarques(args);
    } catch (error) {
      print('Error al obtener comarcas: $error');
    }
  }

  Future<void> _obtenerInfoComarca() async {
    try {
      setState(() {
        orden = 'infocomarca';
        args = 'tu argumento aquí';
      });
      Comarca comarca = await PeticionsHTTP.obtenirInfoComarca(args);
      print(comarca);
    } catch (error) {
      print('Error al obtener información de comarca: $error');
    }
  }

  List<Widget> _buildComarcasWidgets() {
    return comarques.map((comarca) {
      return ListTile(
        title: Text(comarca.comarca),
      );
    }).toList();
  }
}
