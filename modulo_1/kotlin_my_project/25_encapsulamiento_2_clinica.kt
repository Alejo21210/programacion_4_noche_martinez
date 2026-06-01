class TemperaturaVeterinaria(celsius: Double) {

    var celsius: Double = celsius
        set(value) {
            require(value >= 35.0 && value <= 43.0) { "Temperatura fuera del rango vital" }
            field = value
        }

    val fahrenheit: Double
        get() = celsius * 9.0 / 5.0 + 32.0

    val estado: String
        get() = when {
            celsius < 37.5 -> "Hipotermia"
            celsius < 39.0 -> "Normal"
            celsius < 40.5 -> "Fiebre leve"
            else -> "Fiebre alta - Urgente"
        }
}

fun main() {
    val temp = TemperaturaVeterinaria(38.5)
    println("${temp.celsius}°C = ${temp.fahrenheit}°F")
    println(temp.estado)

    temp.celsius = 41.2
    println("${temp.celsius}°C -> ${temp.estado}")
}
