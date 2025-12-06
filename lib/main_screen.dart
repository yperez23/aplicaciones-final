import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_service.dart';
import 'login.dart';
import 'sign_up.dart';
import 'custom_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? ubicacion; // Aquí guardaremos la ubicación

  // Método para obtener ubicación
  Future<void> _getLocation() async {
    Position? pos = await LocationService.getCurrentLocation();

    setState(() {
      if (pos != null) {
        ubicacion = "Lat: ${pos.latitude}, Lon: ${pos.longitude}";
      } else {
        ubicacion = "No se pudo obtener la ubicación";
      }
    });
  }

  // Navegación
  void _navigate(BuildContext context, Widget target) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => target,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
          final curved =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return SlideTransition(position: tween.animate(curved), child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 60),
          const Text(
            "Bienvenido",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),

          // Botón Login
          CustomButton(
            texto: "Iniciar Sesión",
            onPressed: () => _navigate(context, const LoginScreen()),
          ),

          const SizedBox(height: 20),

          // Botón Signup
          CustomButton(
            texto: "Registrarse",
            colorFondo: Color(0xFF00AA55),
            onPressed: () => _navigate(context, const SignupScreen()),
          ),

          const SizedBox(height: 40),

          // --- BOTÓN DE UBICACIÓN ---
          CustomButton(
            texto: "Obtener Ubicación",
            colorFondo: Color(0xFF5555FF),
            onPressed: _getLocation,
          ),

          const SizedBox(height: 20),

          // Mostrar ubicación
          if (ubicacion != null)
            Text(
              ubicacion!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
