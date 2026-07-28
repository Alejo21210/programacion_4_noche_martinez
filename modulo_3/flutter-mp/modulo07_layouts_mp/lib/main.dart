import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart';

const int paso = 4;

void main() => runApp(const VeterinariaApp());

class VeterinariaApp extends StatelessWidget {
  const VeterinariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetCare Vet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => _paso1(),
        2 => Scaffold(
          appBar: AppBar(title: const Text('Historial de la clinica')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Clinica Veterinaria PetCare',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Seguimiento de atencion y recordatorios para tus mascotas.'),
              const SizedBox(height: 12),
              TarjetaLog(
                nivel: 'URGENTE',
                componente: 'Consulta',
                mensaje: 'Milo necesita revision por dolor abdominal.',
                timestamp: DateTime.now(),
              ),
              TarjetaLog(
                nivel: 'INFO',
                componente: 'Vacunacion',
                mensaje: 'Luna recibio su vacuna anual sin inconvenientes.',
                timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
              ),
              TarjetaLog(
                nivel: 'WARN',
                componente: 'Peluqueria',
                mensaje: 'Toby tiene cita pendiente para corte de unas.',
                timestamp: DateTime.now().subtract(const Duration(minutes: 33)),
              ),
              TarjetaLog(
                nivel: 'INFO',
                componente: 'Laboratorio',
                mensaje: 'Resultados de analisis de sangre listos.',
                timestamp: DateTime.now().subtract(const Duration(minutes: 55)),
              ),
            ],
          ),
        ),
        3 => Scaffold(
          appBar: AppBar(title: const Text('Pacientes hoy')),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text('Estado de atencion clinica', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              FilaEstado(nombre: 'Milo', detalle: 'Dolor abdominal - 08:30', activo: true),
              const Divider(height: 1),
              FilaEstado(nombre: 'Luna', detalle: 'Control mensual - 10:15', activo: true),
              const Divider(height: 1),
              FilaEstado(nombre: 'Toby', detalle: 'Cirugia pendiente - 12:40', activo: false),
              const Divider(height: 1),
              FilaEstado(nombre: 'Coco', detalle: 'Revision general - 14:10', activo: true),
            ],
          ),
        ),
        4 => Scaffold(
          appBar: AppBar(title: const Text('Equipo veterinario')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Clinica Veterinaria PetCare', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Tu mascota en buenas manos', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AvatarBadge(nombre: 'Milo', alertas: 2, activo: true),
                    const SizedBox(width: 24),
                    AvatarBadge(nombre: 'Luna', alertas: 0, activo: true),
                    const SizedBox(width: 24),
                    AvatarBadge(nombre: 'Toby', alertas: 1, activo: false),
                    const SizedBox(width: 24),
                    AvatarBadge(nombre: 'Coco', alertas: 3, activo: true),
                    const SizedBox(width: 24),
                    AvatarBadge(nombre: 'Nina', alertas: 4, activo: true),
                  ],
                ),
              ],
            ),
          ),
        ),
        5 => Scaffold(
          appBar: AppBar(title: const Text('Recursos de la clinica')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Layout y espaciado', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Espacios y alineacion para el flujo de trabajo.'),
              const SizedBox(height: 16),
              Container(
                color: Colors.deepOrange.shade50,
                child: const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text('Recepcion con atencion personalizada'),
                ),
              ),
              const SizedBox(height: 24),
              const Align(alignment: Alignment.centerLeft, child: Icon(Icons.pets, color: Colors.deepOrange, size: 36)),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: List.generate(12, (index) => Container(width: 40, height: 40, color: Colors.primaries[index % Colors.primaries.length].shade300)),
              ),
            ],
          ),
        ),
        _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

Widget _paso1() => Scaffold(
  appBar: AppBar(title: const Text('Recepcion veterinaria')),
  body: Center(
    child: Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade50,
        borderRadius: BorderRadius.circular(40),
        border: Border(left: BorderSide(color: Colors.deepOrange, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.pets, color: Colors.deepOrange),
          SizedBox(width: 12),
          Expanded(child: Text('Consulta de Milo - listo para atencion', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    ),
  ),
);

