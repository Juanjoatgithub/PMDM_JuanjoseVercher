import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLoginPressed;

  LoginScreen({required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Aquí puedes configurar la imagen de fondo, el color, etc.
          image: DecorationImage(
            image: AssetImage('assets/bg.webp'),
            fit: BoxFit
                .cover, // Esto hará que la imagen cubra todo el contenedor
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 400,
              ),
              SizedBox(height: 20),
              Text(
                'Les nostres comarques',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lecker'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Usuari',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Contrasenya',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Usa el contexto más cercano que tenga un Navigator
                  Navigator.of(context).pushReplacementNamed('/provincies');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
