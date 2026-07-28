import 'package:go_router/go_router.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_servidores.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/pacientes',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path: '/pacientes',
          builder: (_, _) => const PantallaServidores(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                final servidor = state.extra as ServidorSSH?;
                return PantallaDetalle(id: id, servidor: servidor);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/historial',
          builder: (_, _) => const PantallaMetricas(),
        ),
        GoRoute(
          path: '/ajustes',
          builder: (_, _) => const PantallaAjustes(),
        ),
      ],
    ),
  ],
);
