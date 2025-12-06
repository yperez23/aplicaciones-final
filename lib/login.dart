import 'package:flutter/material.dart';
import 'custom_input.dart';
import 'custom_button.dart';
import 'location_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final correoCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> _obtenerUbicacion() async {
    final position = await LocationService.getCurrentLocation();
    if (position != null) {
      print("Latitud: ${position.latitude}");
      print("Longitud: ${position.longitude}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ubicación obtenida")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No se pudo obtener ubicación")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar Sesión")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInput(
              text: "",
              label: "Correo",
              controller: correoCtrl,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomInput(
              text: "",
              label: "Contraseña",
              controller: passCtrl,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              texto: "Ingresar",
              onPressed: _obtenerUbicacion,
            ),
          ],
        ),
      ),
    );
  }
}
