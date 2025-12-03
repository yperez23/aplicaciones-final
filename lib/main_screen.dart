import 'package:flutter/material.dart';
import 'pokemon_detail.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> pokemons = [
    {
      'name': 'Charmander',
      'type': 'fuego',
      'color': Colors.orange,
      'image':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png'
    },
    {
      'name': 'Squirtle',
      'type': 'agua',
      'color': Colors.blue,
      'image':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png'
    },
    {
      'name': 'Bulbasaur',
      'type': 'planta',
      'color': Colors.green,
      'image':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'
    },
    {
      'name': 'Pikachu',
      'type': 'eléctrico',
      'color': Colors.yellow,
      'image':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'
    },
    {
      'name': 'Eevee',
      'type': 'normal',
      'color': Colors.brown,
      'image':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png'
    },
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = pokemons
        .where((p) => p['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        backgroundColor: const Color.fromARGB(255, 187, 7, 187),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar Pokémon',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: filtered.map((p) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PokemonDetail(
                            name: p['name'],
                            type: p['type'],
                            color: p['color'],
                            image: p['image'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: p['color'].withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(p['image'], height: 80),
                          const SizedBox(height: 10),
                          Text(
                            p['name'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(p['type']),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
