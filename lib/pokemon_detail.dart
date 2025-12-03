import 'package:flutter/material.dart';

class PokemonDetail extends StatelessWidget {
  final String name;
  final String type;
  final Color color;
  final String image;

  const PokemonDetail({
    super.key,
    required this.name,
    required this.type,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.withOpacity(0.3),
      appBar: AppBar(
        title: Text(name),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image, height: 150),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Tipo: $type',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
