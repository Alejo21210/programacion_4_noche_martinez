import 'package:flutter/material.dart';
import 'package:modulo06_widgets/widgets/catalogo_basicos.dart';
import 'package:modulo06_widgets/widgets/servicio_estado.dart';
import 'package:modulo06_widgets/widgets/reloj.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/etiqueta.dart';
import 'screens/pantalla_contexto.dart';
import 'widgets/indicador.dart';

const int paso = 6;

class VeterinariaApp extends StatelessWidget {
  const VeterinariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clínica Veterinaria PetCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: false),
      ),
      home: switch (paso) {
        1 => const Scaffold(body: Center(child: Saludo())),
        2 => const CatalogoBasicos(),
        3 => Scaffold(
          body: Center(
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                Etiqueta(texto: 'Vacunado', color: Colors.green),
                Etiqueta(texto: 'Revisión', color: Colors.orange, relleno: true),
                Etiqueta(texto: 'Urgencia', color: Colors.red),
                Etiqueta(texto: 'Cirugía', color: Colors.deepPurple, fontSize: 16, relleno: true),
                Etiqueta(texto: 'Control', color: Colors.blue, fontSize: 11),
              ],
            ),
          ),
        ),
        4 => const Scaffold(
          body: Center(
            child: ServicioEstado(nombre: 'Consulta de mascotas'),
          ),
        ),
        5 => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContadorLimitado(
                  etiqueta: 'Vacunas aplicadas',
                  limite: 3,
                  color: Colors.red,
                  onLimite: () => debugPrint('¡Cupo diario completo!'),
                ),
                const SizedBox(height: 40),
                ContadorLimitado(
                  etiqueta: 'Pacientes en espera',
                  limite: 10,
                  color: Colors.indigo,
                ),
              ],
            ),
          ),
        ),
        6 => Scaffold(
          appBar: AppBar(title: const Text('Tiempo de atención')),
          body: const Center(child: Reloj()),
        ),
        7 => const PantallaContexto(),
        8 => Scaffold(
          body: Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                Indicador(label: 'Pacientes hoy', valor: '24', color: Colors.green, icono: Icons.pets),
                Indicador(label: 'Urgencias', valor: '3', color: Colors.red, icono: Icons.medical_services, subtitulo: 'Atención inmediata'),
                Indicador(label: 'Citas', valor: '12', color: Colors.indigo, icono: Icons.calendar_today),
                Indicador(label: 'Satisfacción', valor: '98%', color: Colors.teal, icono: Icons.sentiment_satisfied, subtitulo: 'Últimos 30 días'),
              ],
            ),
          ),
        ),
        _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SelectableText(
          'Clínica Veterinaria PetCare\nTu mascota en buenas manos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
            color: Colors.deepOrange.shade700,
            height: 1.3,
          ),
          maxLines: 3,
        ),
      ),
    );
  }
}
