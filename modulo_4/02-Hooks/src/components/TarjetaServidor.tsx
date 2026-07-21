import { Pressable, StyleSheet, Text, View } from 'react-native'
import type { ResultadoConexion } from '@/hooks/useConexionSimulada'

interface PropsTarjeta {
  nombre: string
  hook: ResultadoConexion
}

export function TarjetaServidor({ nombre, hook }: PropsTarjeta) {
  const { estado, intentos, latencia, reconectar, reiniciar } = hook

  const colorEstado: Record<string, string> = {
    desconectado: '#757575',
    conectando: '#1565c0',
    conectado: '#2e7d32',
    error: '#c62828',
  }

  const textoBoton: Record<string, string> = {
    desconectado: 'Conectar',
    conectando: 'Conectando…',
    conectado: 'Reconectar',
    error: 'Reintentar',
  }

  return (
    <View style={[styles.tarjeta, { borderColor: colorEstado[estado], width: '100%' }]}>
      <View style={styles.filaEncabezado}>
        <Text style={styles.nombreServidor}>{nombre}</Text>
        <Text style={[styles.etiqueta, { color: colorEstado[estado] }]}>
          {estado.toUpperCase()}
        </Text>
      </View>

      <Text style={styles.detalle}>
        Intentos: {intentos}
        {latencia !== null ? `  ·  Latencia: ${latencia} ms` : ''}
      </Text>

      <View style={styles.filaBotones}>
        <Pressable
          style={({ pressed }) => [
            styles.boton,
            estado === 'conectando' ? styles.botonDeshabilitado : styles.botonActivo,
            pressed && { opacity: 0.75 },
            { flex: 1 },
          ]}
          onPress={reconectar}
          disabled={estado === 'conectando'}
        >
          <Text style={styles.textoBoton}>{textoBoton[estado]}</Text>
        </Pressable>

        <Pressable
          style={({ pressed }) => [
            styles.botonSecundario,
            pressed && { opacity: 0.75 },
          ]}
          onPress={reiniciar}
        >
          <Text style={styles.textoSecundario}>Reiniciar</Text>
        </Pressable>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  tarjeta: {
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    backgroundColor: '#fff',
    gap: 6,
  },
  filaEncabezado: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  nombreServidor: {
    fontSize: 15,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  etiqueta: {
    fontSize: 12,
    fontWeight: '600',
    letterSpacing: 0.5,
  },
  detalle: {
    fontSize: 13,
    color: '#666',
  },
  filaBotones: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 8,
  },
  boton: {
    paddingVertical: 12,
    borderRadius: 8,
    alignItems: 'center',
    paddingHorizontal: 20,
  },
  botonActivo: {
    backgroundColor: '#1565c0',
  },
  botonDeshabilitado: {
    backgroundColor: '#90a4ae',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 14,
  },
  botonSecundario: {
    paddingHorizontal: 16,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#1565c0',
    justifyContent: 'center',
  },
  textoSecundario: {
    color: '#1565c0',
    fontSize: 13,
  },
})
