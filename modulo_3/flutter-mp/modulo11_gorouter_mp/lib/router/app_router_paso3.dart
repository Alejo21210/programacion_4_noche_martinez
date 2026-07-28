import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_servidores_filtro.dart';
import '../screens/pantalla_detalle.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path: '/pacientes',
      builder: (context, state) {
        final soloUrgente = state.uri.queryParameters['soloUrgente'] == 'true';
        return PantallaServidoresFiltro(soloUrgente: soloUrgente);
      },
    ),
    GoRoute(
      path: '/pacientes/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final servidor = state.extra as ServidorSSH?;
        return PantallaDetalle(id: id, servidor: servidor);
      },
    ),
  ],
);
