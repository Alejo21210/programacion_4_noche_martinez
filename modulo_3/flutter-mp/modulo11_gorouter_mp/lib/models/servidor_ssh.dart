class ServidorSSH {
  final String id;
  final String nombre;
  final String ip;
  final int puerto;
  final bool ssl;

  const ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
  });
}

const servidoresSimulados = [
  ServidorSSH(id: '1', nombre: 'Luna', ip: 'Cama 3', puerto: 1042, ssl: true),
  ServidorSSH(id: '2', nombre: 'Milo', ip: 'Cama 1', puerto: 1043, ssl: true),
  ServidorSSH(id: '3', nombre: 'Nina', ip: 'Sala de espera', puerto: 1044, ssl: false),
];
