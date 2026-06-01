fun main() {
    println("Utilidades de Listas - Clinica Veterinaria")
    val pesos = listOf(5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0)
    println(pesos)
    val dosisRecomendadas = pesos.map { it * 0.15 }
    println(dosisRecomendadas)
    val textosPeso = pesos.map { "Peso${it.toInt()}kg" }
    println(textosPeso)

    println("Filter")
    val pesosPequenios = pesos.filter { it <= 15.0 }
    println(pesosPequenios)
    val pesosGrandes = pesos.filter { it > 25.0 }
    println(pesosGrandes)
    val pesosMedianos = pesos.filter { it in 15.1..30.0 }
    println(pesosMedianos)
}
