import 'package:flutter/material.dart';
import 'custom_input.dart';
import 'custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nombreCtrl = TextEditingController();
  final apPatCtrl = TextEditingController();
  final apMatCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final telefonoCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final passConfirmCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInput(text: "", label: "Nombre", controller: nombreCtrl),
            CustomInput(
                text: "", label: "Apellido Paterno", controller: apPatCtrl),
            CustomInput(
                text: "", label: "Apellido Materno", controller: apMatCtrl),
            CustomInput(
              text: "",
              label: "Correo",
              controller: correoCtrl,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomInput(
              text: "",
              label: "Teléfono",
              controller: telefonoCtrl,
              keyboardType: TextInputType.phone,
            ),
            CustomInput(
              text: "",
              label: "Contraseña",
              controller: passCtrl,
              isPassword: true,
            ),
            CustomInput(
              text: "",
              label: "Confirmar Contraseña",
              controller: passConfirmCtrl,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              texto: "Registrarse",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
