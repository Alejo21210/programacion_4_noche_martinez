import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'producto.dart';
import 'producto_dto.dart';

class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<RazaPerro>> _fetchBreeds() async {
    final res = await http.get(
      Uri.parse('https://dog.ceo/api/breeds/list/all'),
    );
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final breeds = body['message'] as Map<String, dynamic>;
    return breeds.entries.map((e) {
      return DogBreedDto(
        name: e.key,
        subBreeds: (e.value as List).cast<String>(),
      ).toDomain();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · Razas de perros'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<RazaPerro>>(
        future: _fetchBreeds(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final lista = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: lista.length,
            itemBuilder: (context, i) {
              final r = lista[i];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown[100],
                    child: const Icon(Icons.pets, color: Colors.brown),
                  ),
                  title: Text(r.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    r.subrazas.isEmpty
                        ? 'Sin subrazas'
                        : 'Subrazas: ${r.subrazas.length}',
                  ),
                  trailing: r.subrazas.isNotEmpty
                      ? Chip(
                          label: Text('${r.subrazas.length}'),
                          backgroundColor: Colors.amber[100],
                        )
                      : null,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
