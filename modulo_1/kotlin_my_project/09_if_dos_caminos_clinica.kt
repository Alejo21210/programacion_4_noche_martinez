fun main() {
    println("Control de Flujo - Clinica Veterinaria")
    println("If Dos Caminos")
    println("La mascota tiene seguro medico? s/n")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"
    println("Costo base de la consulta? $")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0
    if (tieneSeguro) {
        val cobertura = costoBase * 0.80
        println("Seguro cubre $${"%.2f".format(cobertura)}. Duenio paga $${"%.2f".format(costoBase - cobertura)}")
    } else {
        println("Duenio paga $${"%.2f".format(costoBase)}")
    }
}
