class HistoriaClinica(val peso: Double, val temperatura: Double) {
    val indiceSalud: Double get() = peso / temperatura
    val riesgo: String get() = when {
        indiceSalud < 0.5 -> "Alto riesgo"
        indiceSalud < 1.0 -> "Riesgo moderado"
        else -> "Estable"
    }

    constructor(peso: Int, temperatura: Int) : this(peso.toDouble(), temperatura.toDouble())
    constructor(peso: Int) : this(peso.toDouble(), 38.5)

    override fun toString() = "Historia: ${peso}kg/${temperatura}°C | riesgo=$riesgo"
}

fun main() {
    val h1 = HistoriaClinica(15.0, 39.5)
    val h2 = HistoriaClinica(5, 38)
    val h3 = HistoriaClinica(25)

    println(h1)
    println(h2)
    println(h3)
}
