import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'todo_dto.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<CatBreedDto>> _fetchBreeds() async {
    final res = await http.get(
      Uri.parse('https://catfact.ninja/breeds?limit=30'),
    );
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final lista = body['data'] as List<dynamic>;
    return lista
        .map((e) => CatBreedDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · Razas de gatos'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<CatBreedDto>>(
        future: _fetchBreeds(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final breeds = snap.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Chip(
                  label: Text('${breeds.length} razas encontradas'),
                  backgroundColor: Colors.teal[100],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: breeds.length,
                  itemBuilder: (context, i) {
                    final b = breeds[i];
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.pets, color: Colors.white),
                      ),
                      title: Text(b.breed,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('${b.country} · ${b.coat} · ${b.pattern}'),
                      trailing: Text(b.origin,
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey)),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
