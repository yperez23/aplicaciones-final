import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController apellidoPController = TextEditingController();
    final TextEditingController apellidoMController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController telefonoController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: apellidoPController,
              decoration: const InputDecoration(
                labelText: 'Apellido Paterno',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: apellidoMController,
              decoration: const InputDecoration(
                labelText: 'Apellido Materno',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: telefonoController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmar Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes manejar el registro
                  String nombre = nombreController.text;
                  String apellidoP = apellidoPController.text;
                  String apellidoM = apellidoMController.text;
                  String email = emailController.text;
                  String telefono = telefonoController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;

                  print(
                      'Registro: $nombre $apellidoP $apellidoM, $email, $telefono');
                  if (password != confirmPassword) {
                    print('Las contraseñas no coinciden');
                  }
                },
                child: const Text('Registrarse'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
