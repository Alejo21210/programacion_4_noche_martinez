fun main() {
    println("Control de Flujo - Clinica Veterinaria")
    println("If Simple")
    println("Temperatura de la mascota en grados centigrados:")
    val temperatura = readLine()?.toDoubleOrNull() ?: 38.0
    if (temperatura >= 39.0) {
        println("Fiebre detectada en la mascota")
    }
    if (temperatura >= 41.0) {
        println("Fiebre alta - urgencia veterinaria")
    }
    println("Temperatura registrada: $temperatura")
}
