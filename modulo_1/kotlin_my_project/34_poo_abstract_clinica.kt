abstract class AnimalAbstracto(val nombre: String) {
    abstract val edadHumana: Int
    abstract val pesoPromedio: Double
    abstract fun descripcion(): String

    fun comparar(otro: AnimalAbstracto): String = when {
        edadHumana > otro.edadHumana -> "$nombre es mayor que ${otro.nombre}"
        edadHumana < otro.edadHumana -> "$nombre es menor que ${otro.nombre}"
        else -> "$nombre y ${otro.nombre} tienen la misma edad"
    }

    override fun toString() = "${descripcion()} | Edad humana: $edadHumana"
}

class PerroAbstracto(val nombreMascota: String, val edadPerro: Int) : AnimalAbstracto(nombreMascota) {
    override val edadHumana: Int get() = edadPerro * 7
    override val pesoPromedio: Double get() = 20.0
    override fun descripcion() = "Perro $nombreMascota de $edadPerro anios"
}

class GatoAbstracto(val nombreMascota: String, val edadGato: Int) : AnimalAbstracto(nombreMascota) {
    override val edadHumana: Int get() = edadGato * 6
    override val pesoPromedio: Double get() = 4.5
    override fun descripcion() = "Gato $nombreMascota de $edadGato anios"
}

class ConejoAbstracto(val nombreMascota: String, val edadConejo: Int) : AnimalAbstracto(nombreMascota) {
    override val edadHumana: Int get() = edadConejo * 5
    override val pesoPromedio: Double get() = 2.5
    override fun descripcion() = "Conejo $nombreMascota de $edadConejo anios"
}

fun main() {
    val animales: List<AnimalAbstracto> = listOf(
        PerroAbstracto("Max", 5),
        GatoAbstracto("Misi", 3),
        ConejoAbstracto("Copito", 2)
    )

    animales.forEach { println(it) }

    val mayor = animales.maxByOrNull { it.edadHumana }
    println("\nAnimal con mayor edad humana: ${mayor?.nombre}")

    println(animales[0].comparar(animales[1]))
}
