import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';
import '../widgets/tarjeta_servidor_grid.dart';

class PantallaServidores extends StatefulWidget {
  const PantallaServidores({super.key});

  @override
  State<PantallaServidores> createState() => _PantallaServidoresState();
}

class _PantallaServidoresState extends State<PantallaServidores> {
  final _pacientes = [
    ServidorSSH(id:'1', nombre:'Luna', ip:'10.0.2.10', puerto:22, usuario:'Dra. Sofia', so:'Vacunacion', ssl:true, favorito:true),
    ServidorSSH(id:'2', nombre:'Milo', ip:'10.0.2.20', puerto:22, usuario:'Dr. Mateo', so:'Chequeo', ssl:true),
    ServidorSSH(id:'3', nombre:'Nina', ip:'10.0.3.10', puerto:2222, usuario:'Dra. Ana', so:'Radiografia', ssl:false),
    ServidorSSH(id:'4', nombre:'Toby', ip:'192.168.1.5', puerto:22, usuario:'Dr. Luis', so:'Peluqueria', ssl:false),
  ];

  bool _modoGrid = false;

  void _toggleFavorito(int i) => setState(() => _pacientes[i].favorito = !_pacientes[i].favorito);

  void _eliminar(int i) => setState(() => _pacientes.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes (${_pacientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadr?cula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _pacientes.length,
              itemBuilder: (ctx, i) => TarjetaServidorGrid(
                servidor: _pacientes[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount: _pacientes.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                servidor: _pacientes[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}
