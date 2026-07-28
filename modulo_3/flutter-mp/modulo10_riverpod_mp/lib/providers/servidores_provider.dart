import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/servidor_ssh.dart';

class ServidoresNotifier extends Notifier<List<ServidorSSH>> {
  @override
  List<ServidorSSH> build() => [
    ServidorSSH(id: '1', nombre: 'Luna', ip: 'Cama 3', puerto: 22, ssl: true, favorito: true),
    ServidorSSH(id: '2', nombre: 'Milo', ip: 'Cama 1', puerto: 22, ssl: true),
    ServidorSSH(id: '3', nombre: 'Nina', ip: 'Sala de espera', puerto: 2222, ssl: false),
    ServidorSSH(id: '4', nombre: 'Toby', ip: 'Cama 2', puerto: 22, ssl: false),
  ];

  void toggleFavorito(String id) {
    state = state
        .map(
          (s) => s.id == id
              ? ServidorSSH(
                  id: s.id,
                  nombre: s.nombre,
                  ip: s.ip,
                  puerto: s.puerto,
                  ssl: s.ssl,
                  favorito: !s.favorito,
                )
              : s,
        )
        .toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(ServidorSSH servidor) {
    state = [...state, servidor];
  }
}

final servidoresProvider = NotifierProvider<ServidoresNotifier, List<ServidorSSH>>(
  ServidoresNotifier.new,
);
