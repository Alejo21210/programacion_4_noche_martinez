import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';
import '../widgets/tarjeta_servidor_grid.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});

  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _pacientes = [
    ServidorSSH(id:'1', nombre:'Luna', ip:'10.0.2.10', puerto:22, usuario:'Dra. Sofia', so:'Vacunacion', ssl:true, favorito:true),
    ServidorSSH(id:'2', nombre:'Milo', ip:'10.0.2.20', puerto:22, usuario:'Dr. Mateo', so:'Chequeo', ssl:true),
    ServidorSSH(id:'3', nombre:'Nina', ip:'10.0.3.10', puerto:2222, usuario:'Dra. Ana', so:'Radiografia', ssl:false),
    ServidorSSH(id:'4', nombre:'Toby', ip:'192.168.1.5', puerto:22, usuario:'Dr. Luis', so:'Peluqueria', ssl:false),
  ];

  String _busqueda = '';
  bool _modoGrid = false;

  List<ServidorSSH> get _filtrados => _pacientes.where((paciente) {
    final texto = _busqueda.toLowerCase();
    return paciente.nombre.toLowerCase().contains(texto) ||
        paciente.usuario.toLowerCase().contains(texto) ||
        paciente.so.toLowerCase().contains(texto);
  }).toList();

  void _toggleFavorito(ServidorSSH paciente) => setState(() => paciente.favorito = !paciente.favorito);

  void _eliminar(ServidorSSH paciente) => setState(() => _pacientes.removeWhere((x) => x.id == paciente.id));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por nombre, veterinario o motivo...',
              leading: const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [IconButton(icon: const Icon(Icons.clear), onPressed: () => setState(() => _busqueda = ''))]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
            ),
          ),
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
            ),
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off, size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text('Sin resultados para "$_busqueda"', style: TextStyle(color: cs.onSurfaceVariant)),
                        const SizedBox(height: 8),
                        TextButton(onPressed: () => setState(() => _busqueda = ''), child: const Text('Limpiar b?squeda')),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaServidorGrid(
                          servidor: filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filtrados.length,
                        separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaServidor(
                          servidor: filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
