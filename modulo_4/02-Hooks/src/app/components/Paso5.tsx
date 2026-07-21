import { StyleSheet, Text, View } from 'react-native'
import { TarjetaServidor } from '@/components/TarjetaServidor'
import { useConexionSimulada } from '@/hooks/useConexionSimulada'

export default function EstadoServicios() {
  const webHook = useConexionSimulada('web-02')
  const cacheHook = useConexionSimulada('cache-02')

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Estado de Servicios</Text>
      <TarjetaServidor nombre="web-02" hook={webHook} />
      <TarjetaServidor nombre="cache-02" hook={cacheHook} />
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: '#f5f5f5',
    gap: 14,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a1a1a',
  },
})
