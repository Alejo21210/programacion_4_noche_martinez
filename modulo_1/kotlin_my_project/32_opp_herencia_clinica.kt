class SerVivo(val nombre: String)

open class AnimalClinica(val nombre: String, val sonido: String) {
    open fun hacerSonido() = println("$nombre dice: $sonido")
    open fun descripcion() = "Soy $nombre"

    fun respirar() = println("$nombre respira")
}

class Perro(nombre: String) : AnimalClinica(nombre, "Guau") {
    override fun hacerSonido() {
        super.hacerSonido()
        println("(mueve la cola)")
    }
    override fun descripcion() = "${super.descripcion()}, un perro"
}

class Gato(nombre: String, val interior: Boolean) : AnimalClinica(nombre, "Miau") {
    override fun descripcion() =
        "${super.descripcion()}, un gato ${if (interior) "domestico" else "callejero"}"
}

fun main() {
    val perro = Perro("Max")
    perro.hacerSonido()

    val gato = Gato("Misi", true)
    println(gato.descripcion())

    perro.respirar()
}
