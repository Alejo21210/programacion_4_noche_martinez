fun main() {
    println("Ciclos repeat - Clinica Veterinaria")
    println("Cuantas mediciones de temperatura tomara?")
    val mediciones = readLine()?.toIntOrNull() ?: 3
    var totalTemperatura = 0.0
    repeat(mediciones) { i ->
        println("Medicion ${i + 1} (temperatura en °C):")
        val temp = readLine()?.toDoubleOrNull() ?: 38.0
        totalTemperatura += temp
    }
    val promedio = totalTemperatura / mediciones
    println("Temperatura promedio: ${"%.2f".format(promedio)} °C")
    println("Clasificacion: ${
        when {
            promedio < 37.5 -> "Hipotermia"
            promedio <= 39.0 -> "Normal"
            else -> "Fiebre"
        }
    }")
}
