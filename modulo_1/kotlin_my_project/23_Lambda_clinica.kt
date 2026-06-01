fun main() {
    println("Funcion Lambda - Clinica Veterinaria")
    val calcDosis: (Double, Double) -> Double = { peso: Double, factor: Double -> peso * factor }
    println(calcDosis(15.0, 0.1))
    val calcDosis2: (Double, Double) -> Double = { peso, factor -> peso * factor }
    println(calcDosis2(15.0, 0.1))
    val duplicarPeso: (Double) -> Double = { it + it }
    println(duplicarPeso(12.5))
}
