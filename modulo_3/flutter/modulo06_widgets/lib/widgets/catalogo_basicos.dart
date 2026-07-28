import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'nginx-proxy: En línea',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── TextDecoration.lineThrough ──────────────────────────────────────────
          const Text(
            'Servicio mysql-db → SIN CONEXIÓN',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.red,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),

          // ── maxLines: 2, justify, fade ─────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east → sin respuesta · '
              'timeout excedido tras 30s de espera · reintentando conexión...',
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),

          // ── overflow: clip — trunca sin fade ni ellipsis ──────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east → sin respuesta · '
              'timeout excedido tras 30s de espera · reintentando conexión...',
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          const SizedBox(height: 8),

          // ── softWrap: false — el texto no salta de línea ──────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'redis-cache: latencia 245ms · conexiones activas: 1,024 · memoria: 68%',
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'CRÍTICO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última revisión hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── SelectableText — el usuario puede seleccionar y copiar ───────────
          const SelectableText(
            '10.0.0.12:5432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const SizedBox(height: 8),

          // ── Iconos representando estado de servicios ──────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'Servidor activo',
                child: Icon(
                  Icons.check_circle_outline,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Icon(Icons.cancel, size: 40, color: Colors.red),
              const Icon(Icons.warning_amber, size: 14, color: Colors.orange),
              const Icon(Icons.dns, size: 40, color: Colors.indigo),
              const Icon(Icons.wifi_off, size: 40, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ), // leído por lectores de pantalla
          const SizedBox(height: 8),

          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
              FilledButton(  onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(    onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(onPressed: () {}, child: const Text('Desactivado')),
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.refresh, size: 18),
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.info, size: 18),
                label: const Text('Detalles'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.delete, size: 18),
                label: const Text('Eliminar'),
              ),
              IconButton(
                onPressed: () {},
                icon:     const Icon(Icons.settings),
                color:    Colors.indigo,
                iconSize: 28,
                tooltip:  'Detiene todos los servicios',
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado (elevation: 0) ──────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape:       const StadiumBorder(),
              elevation:   0,
            ),
            child: const Text('Acción crítica',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),

          // ── Misma base con elevation: 12 ───────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape:       const StadiumBorder(),
              elevation:   12,
            ),
            child: const Text('Elevado',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 8),

          // ── Card plana (elevation: 0) con ListTile de 3 líneas ────────────────
          Card(
            elevation: 0,
            color: Colors.red.shade50,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 12),
              leading:  const Icon(Icons.dns, color: Colors.indigo),
              title:    const Text('nginx-proxy'),
              subtitle: const Text(
                '10.0.0.5 · 45ms · conexiones activas: 1,024 '
                '· memoria: 68% · CPU: 23% · uptime: 72h'),
              isThreeLine: true,
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap:    () {},
            ),
          ),
          // ── Card con sombra pronunciada (elevation: 12) ────────────────────────
          Card(
            elevation: 12,
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title:    const Text('backup-worker'),
              subtitle: const Text('sin respuesta · 10.0.0.30'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          // ── Card con Switch integrado ──────────────────────────────────────────
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo mantenimiento'),
            ),
          ),
          const SizedBox(height: 8),

          // ── Chip ──────────────────────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              Chip(
                padding:   const EdgeInsets.all(8),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted:  () {},
                label:      const Text('nginx'),
              ),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle:      TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label:      const Text('HTTP/2'),
                selected:   false,
                onSelected: (_) {},
              ),
              InputChip(
                label:      const Text('redis'),
                avatar:     const Icon(Icons.memory, size: 16),
                selected:   true,
                onSelected: (_) {},
                onDeleted:  () {},
              ),
              ActionChip(
                label:     const Text('Ver logs'),
                avatar:    const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade200,
                )),
              const SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  color:       Colors.green,
                  strokeWidth: 6,
                )),
              const SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       0.3,
                  color:       Colors.red,
                  strokeWidth: 3,
                  strokeCap:   StrokeCap.round,
                )),
              Transform.scale(
                scale: 0.5,
                child: const SizedBox(width: 48, height: 48,
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  )),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(),
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.6, color: Colors.indigo),
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value:     1.0,
            color:     Colors.green,
            minHeight: 12,
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}
