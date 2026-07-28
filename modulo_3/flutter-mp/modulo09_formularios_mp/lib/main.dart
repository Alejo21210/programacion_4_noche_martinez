// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/formulario_servidor.dart';
import 'models/servidor_ssh.dart';
import 'widgets/fila_servidor.dart';
import 'screens/pantalla_servidores.dart';
import 'screens/pantalla_busqueda.dart';

const int paso = 5;

void main() => runApp(const AppVeterinaria());

class AppVeterinaria extends StatelessWidget {
  const AppVeterinaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          primary: const Color(0xFF00695C),
          secondary: const Color(0xFFFF8F00),
          tertiary: const Color(0xFFD84315),
        ),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const _Paso2(),
        3 => const _Paso3(),
        4 => const PantallaServidores(),
        5 => const PantallaBusqueda(),
        _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class _Paso1 extends StatefulWidget {
  const _Paso1();

  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlNombrePaciente = TextEditingController();
  final _ctrlEdad = TextEditingController();
  final _ctrlMotivo = TextEditingController();
  final _focusEdad = FocusNode();
  final _focusMotivo = FocusNode();

  @override
  void dispose() {
    _ctrlNombrePaciente.dispose();
    _ctrlEdad.dispose();
    _ctrlMotivo.dispose();
    _focusEdad.dispose();
    _focusMotivo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de paciente'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ctrlNombrePaciente,
              decoration: const InputDecoration(
                labelText: 'Nombre del paciente',
                hintText: 'Luna',
                prefixIcon: Icon(Icons.pets),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusEdad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlEdad,
              focusNode: _focusEdad,
              decoration: const InputDecoration(
                labelText: 'Edad',
                hintText: '3 a?os',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusMotivo.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlMotivo,
              focusNode: _focusMotivo,
              decoration: const InputDecoration(
                labelText: 'Motivo de visita',
                hintText: 'Vacunacion',
                prefixIcon: Icon(Icons.medical_information),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registro listo para ${_ctrlNombrePaciente.text}'), behavior: SnackBarBehavior.floating),
                );
              },
              icon: const Icon(Icons.save_alt),
              label: const Text('Guardar ficha'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombrePaciente.clear();
                _ctrlEdad.clear();
                _ctrlMotivo.clear();
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Paso3 extends StatefulWidget {
  const _Paso3();

  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _pacientes = [
    ServidorSSH(id:'1', nombre:'Luna', ip:'10.0.2.10', puerto:22, usuario:'Dra. Sofia', so:'Vacunacion', ssl:true, favorito:true),
    ServidorSSH(id:'2', nombre:'Milo', ip:'10.0.2.20', puerto:22, usuario:'Dr. Mateo', so:'Chequeo', ssl:true),
    ServidorSSH(id:'3', nombre:'Nina', ip:'10.0.3.10', puerto:2222, usuario:'Dra. Ana', so:'Radiografia', ssl:false),
    ServidorSSH(id:'4', nombre:'Toby', ip:'192.168.1.5', puerto:22, usuario:'Dr. Luis', so:'Peluqueria', ssl:false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes (${_pacientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _pacientes.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pets_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin pacientes', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount: _pacientes.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                servidor: _pacientes[i],
                onFavorito: () => setState(() => _pacientes[i].favorito = !_pacientes[i].favorito),
                onEliminar: () => setState(() => _pacientes.removeAt(i)),
              ),
            ),
    );
  }
}

class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva ficha'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioServidor(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ficha guardada para ${datos['nombre']}'), behavior: SnackBarBehavior.floating),
            );
          },
        ),
      ),
    );
  }
}
