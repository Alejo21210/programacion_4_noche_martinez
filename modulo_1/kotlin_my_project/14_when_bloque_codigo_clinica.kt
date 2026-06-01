fun main() {
    println("When con bloques de codigo - Clinica Veterinaria")
    println("Nombre de la mascota:")
    val mascota = readLine()?.trim() ?: ""
    println("Nivel de urgencia CRITICO/URGENTE/MODERADO/LEVE:")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "CRITICO" -> {
            println("ALERTA CRITICA - Mascota: $mascota")
            println("Cirugia o atencion inmediata requerida")
            println("Registrar hora de ingreso a emergencia")
        }
        "URGENTE" -> {
            println("URGENTE - Mascota: $mascota")
            println("Priorizar en sala de espera")
            println("Reevaluar en 15 minutos")
        }
        "MODERADO" -> println("Moderado - Mascota: $mascota. Registrar y monitorear")
        "LEVE" -> println("Leve - Mascota: $mascota. Registrar en consulta normal")
        else -> println("Protocolo no reconocido")
    }
    println("Peso (kg):")
    val peso = readLine()?.toDoubleOrNull() ?: 0.0
    val tamano = when (peso) {
        in 0.0..5.0 -> "Miniatura"
        in 5.1..15.0 -> "Pequenio"
        in 15.1..30.0 -> "Mediano"
        in 30.1..50.0 -> "Grande"
        else -> "Gigante"
    }
    println("$peso kg -> $tamano")
}
