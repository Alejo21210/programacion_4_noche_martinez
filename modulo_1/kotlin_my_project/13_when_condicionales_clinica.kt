fun main() {
    println("when con condiciones - Clinica Veterinaria")
    println("Edad de la mascota (meses):")
    val edadMeses = readLine()?.toIntOrNull() ?: 0
    println("Esta vacunado? s/n")
    val estaVacunado = readLine()?.trim()?.lowercase() == "s"
    val tipoVacuna = if (estaVacunado) {
        println("Tipo de vacuna (BASICA/COMPLETA/REFUERZO):")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""
    val dosis = when {
        !estaVacunado && edadMeses < 2 -> 0.0
        !estaVacunado && edadMeses >= 12 -> 1.0
        !estaVacunado -> 0.5
        tipoVacuna == "BASICA" -> 0.5
        tipoVacuna == "COMPLETA" -> 0.3
        tipoVacuna == "REFUERZO" -> 1.0
        else -> 0.5
    }
    println("Dosis a aplicar: ${"%.2f".format(dosis)} ml")
}
