fun main() {
    val nombreMascota = "Max"
    val edadMascota: Int = 5
    var peso = 12.5
    peso = peso + 0.5

    println("$nombreMascota tiene $edadMascota anios y pesa $peso kg")

    val numPerros: Byte = 15
    val numGatos: Short = 200
    val numAtenciones: Int = 1234
    val numTotal: Long = 15_000_000_000

    println(numPerros)
    println(numGatos)
    println(numAtenciones)
    println(numTotal)

    val temperatura: Float = 38.5f
    val dosis: Double = 2.5

    val vacunado: Boolean = true
    val especie: Char = 'P'
    val raza: String = "Labrador"
    val inferido = "veterinaria"
    println("Tipo de inferido: ${inferido::class.simpleName}")
    val inferido1 = 12
    println("Tipo de inferido: ${inferido1::class.simpleName}")

    val nombreDuenio = "Carlos"
    val apellidoDuenio = "Lopez"
    val nombreDuenioMayus = nombreDuenio.uppercase()
    val apellidoDuenioMayus = apellidoDuenio.uppercase()

    println("Duenio: ${nombreDuenioMayus} ${apellidoDuenioMayus}")
    println("Duenio: ${nombreDuenio.uppercase()} ${apellidoDuenio.uppercase()}")
}
