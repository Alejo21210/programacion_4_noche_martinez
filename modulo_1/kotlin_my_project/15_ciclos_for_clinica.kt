fun main() {
    println("CICLOS for - Clinica Veterinaria")
    for (i in 1..5) {
        println("Consulta veterinaria #$i")
    }
    println("until")
    for (i in 1 until 5) {
        println("Vacuna #$i aplicada")
    }
    println("listas")
    val mascotas = listOf("Max", "Luna", "Toby")
    for (mascota in mascotas) {
        println(mascota)
    }
    println("indice valor")
    for ((index, valor) in mascotas.withIndex()) {
        println("$index, $valor")
    }

    println("break")
    for (i in 1..5) {
        if (i == 3) {
            break
        }
        println(i)
    }
    println("Continue")
    for (i in 1..5) {
        if (i == 3) {
            continue
        }
        println(i)
    }
}
