data class Mascota(
    val id: Int,
    val nombre: String,
    val edad: Int,
    val especie: String,
    val activo: Boolean = true
)

fun main() {
    val m1 = Mascota(1, "Max", 5, "Perro")
    val m2 = Mascota(1, "Max", 5, "Perro")
    val m3 = Mascota(2, "Luna", 3, "Gato")

    println(m1)

    println(m1 == m2)
    println(m1 == m3)

    val cachorro = m1.copy(edad = 1)
    val inactivo = m1.copy(activo = false)

    val (id, nombre, edad) = m1
    println("$id: $nombre - $edad anios")

    listOf(m1, m2, m3).forEach { (id2, nombre2, edad2) ->
        println("[$id2] $nombre2: $edad2 anios")
    }
}
