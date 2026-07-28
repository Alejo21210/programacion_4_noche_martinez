import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Paciente {
  final int id;
  final String nombre;
  final String especie;
  final String raza;
  final int edad;
  final String propietario;

  const Paciente({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.raza,
    required this.edad,
    required this.propietario,
  });
}

class PacienteRepository {
  final List<Paciente> _pacientes = [
    Paciente(id: 1, nombre: 'Luna', especie: 'Gato', raza: 'Siames', edad: 3, propietario: 'Maria Garcia'),
    Paciente(id: 2, nombre: 'Max', especie: 'Perro', raza: 'Labrador', edad: 5, propietario: 'Carlos Lopez'),
    Paciente(id: 3, nombre: 'Peluza', especie: 'Conejo', raza: 'Angora', edad: 2, propietario: 'Ana Martinez'),
  ];

  List<Paciente> getAll() => List.unmodifiable(_pacientes);

  void add(Paciente p) => _pacientes.add(p);

  void remove(int id) => _pacientes.removeWhere((p) => p.id == id);
}

final _pacientesProvider = NotifierProvider<PacientesNotifier, List<Paciente>>(PacientesNotifier.new);

class PacientesNotifier extends Notifier<List<Paciente>> {
  final _repo = PacienteRepository();

  @override
  List<Paciente> build() => _repo.getAll();

  void agregar(Paciente p) {
    _repo.add(p);
    state = _repo.getAll();
  }

  void eliminar(int id) {
    _repo.remove(id);
    state = _repo.getAll();
  }
}

class PantallaPaso5 extends ConsumerWidget {
  const PantallaPaso5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pacientes = ref.watch(_pacientesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 5 · Pacientes'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: pacientes.isEmpty
          ? const Center(child: Text('No hay pacientes registrados'))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: pacientes.length,
              itemBuilder: (context, i) {
                final p = pacientes[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _colorEspecie(p.especie),
                      child: Text(
                        p.nombre[0].toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(p.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${p.especie} · ${p.raza} · ${p.edad} anios\nDuenno: ${p.propietario}'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => ref.read(_pacientesProvider.notifier).eliminar(p.id),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _mostrarDialogo(context, ref),
      ),
    );
  }

  Color _colorEspecie(String especie) {
    switch (especie.toLowerCase()) {
      case 'perro': return Colors.brown;
      case 'gato': return Colors.teal;
      case 'conejo': return Colors.purple;
      case 'ave': return Colors.blue;
      default: return Colors.grey;
    }
  }

  void _mostrarDialogo(BuildContext context, WidgetRef ref) {
    final nombreCtrl = TextEditingController();
    final especieCtrl = TextEditingController();
    final razaCtrl = TextEditingController();
    final edadCtrl = TextEditingController();
    final propCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nuevo paciente'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nombreCtrl, decoration: const InputDecoration(labelText: 'Nombre')),
              TextField(controller: especieCtrl, decoration: const InputDecoration(labelText: 'Especie')),
              TextField(controller: razaCtrl, decoration: const InputDecoration(labelText: 'Raza')),
              TextField(controller: edadCtrl, decoration: const InputDecoration(labelText: 'Edad'), keyboardType: TextInputType.number),
              TextField(controller: propCtrl, decoration: const InputDecoration(labelText: 'Dueno')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () {
              final id = DateTime.now().millisecondsSinceEpoch;
              final p = Paciente(
                id: id,
                nombre: nombreCtrl.text,
                especie: especieCtrl.text,
                raza: razaCtrl.text,
                edad: int.tryParse(edadCtrl.text) ?? 0,
                propietario: propCtrl.text,
              );
              ref.read(_pacientesProvider.notifier).agregar(p);
              Navigator.pop(ctx);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
