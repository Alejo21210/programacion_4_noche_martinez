fun main() {
    println("Condicional When - Clinica Veterinaria")
    println("Codigo de especie (1-5)")
    println("1->Perro")
    println("2->Gato")
    println("3->Ave")
    println("4->Roedor")
    println("5->Reptil")
    val codigo = readLine()?.toIntOrNull() ?: 0
    val especie = when (codigo) {
        1 -> "Perro"
        2 -> "Gato"
        3 -> "Ave"
        4 -> "Roedor"
        5 -> "Reptil"
        else -> "Especie no registrada"
    }
    println("Especie: $especie")
}
