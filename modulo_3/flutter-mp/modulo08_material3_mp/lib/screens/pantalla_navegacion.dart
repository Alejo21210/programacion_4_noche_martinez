// lib/screens/pantalla_navegacion.dart
import 'package:flutter/material.dart';

class PantallaNavegacion extends StatefulWidget {
  final VoidCallback? onBack;

  const PantallaNavegacion({super.key, this.onBack});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de control'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: widget.onBack == null
            ? null
            : IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboard(),
          _PantallaPacientes(),
          _PantallaAlertas(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.primaryContainer,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets), label: 'Pacientes'),
          NavigationDestination(icon: Badge(label: Text('2'), child: Icon(Icons.notifications_outlined)), selectedIcon: Badge(label: Text('2'), child: Icon(Icons.notifications)), label: 'Alertas'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }
}

class _PantallaDashboard extends StatelessWidget {
  const _PantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen del dia', style: text.headlineSmall),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _TarjetaMetrica(titulo: 'Pacientes', valor: '24', icono: Icons.pets, color: cs.primaryContainer)),
            const SizedBox(width: 8),
            Expanded(child: _TarjetaMetrica(titulo: 'Urgencias', valor: '2', icono: Icons.warning_amber, color: cs.errorContainer)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _TarjetaMetrica(titulo: 'Vacunas', valor: '7', icono: Icons.vaccines, color: cs.tertiaryContainer)),
            const SizedBox(width: 8),
            Expanded(child: _TarjetaMetrica(titulo: 'Cirugias', valor: '3', icono: Icons.healing, color: cs.secondaryContainer)),
          ],
        ),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color color;

  const _TarjetaMetrica({required this.titulo, required this.valor, required this.icono, required this.color});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor, style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaPacientes extends StatelessWidget {
  const _PantallaPacientes();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (ctx, i) {
        final pacientes = ['Luna', 'Milo', 'Nina', 'Toby', 'Coco'];
        final estados = ['En consulta', 'Recuperacion', 'Listo para irse', 'Observacion', 'Vacunado'];
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: cs.primaryContainer, child: Icon(Icons.pets, color: cs.onPrimaryContainer)),
            title: Text(pacientes[i]),
            subtitle: Text(estados[i]),
            trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class _PantallaAlertas extends StatelessWidget {
  const _PantallaAlertas();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const alertas = [
      ('Luna', 'Necesita control de glucosa', 'URGENTE'),
      ('Milo', 'Proxima vacuna en 2 horas', 'AVISO'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: alertas.length,
      itemBuilder: (ctx, i) {
        final alerta = alertas[i];
        final esUrgente = alerta.$3 == 'URGENTE';
        return Card(
          color: esUrgente ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(esUrgente ? Icons.error : Icons.warning, color: esUrgente ? cs.onErrorContainer : cs.onTertiaryContainer),
            title: Text(alerta.$1, style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(alerta.$2),
            trailing: Chip(label: Text(alerta.$3), backgroundColor: esUrgente ? cs.error : cs.tertiary, labelStyle: TextStyle(color: esUrgente ? cs.onError : cs.onTertiary)),
          ),
        );
      },
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(leading: Icon(Icons.notifications_active_outlined), title: Text('Notificaciones de turnos'), trailing: Icon(Icons.chevron_right)),
        ListTile(leading: Icon(Icons.security_outlined), title: Text('Seguridad del historial'), trailing: Icon(Icons.chevron_right)),
        ListTile(leading: Icon(Icons.info_outline), title: Text('Acerca de la clinica'), trailing: Icon(Icons.chevron_right)),
      ],
    );
  }
}
