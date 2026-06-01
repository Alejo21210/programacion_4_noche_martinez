interface Identificable {
    val id: String
    fun serializar(): String
    val version: Int get() = 1
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  $it") }
    }
}

data class FichaMedica(
    override val id: String,
    val mascota: String,
    val vacunas: List<String>,
    val peso: Double
) : Identificable, Validable {

    override fun serializar() =
        "$id|$mascota|${vacunas.joinToString(",")}|$peso"

    override val errores: List<String> get() = buildList {
        if (mascota.isBlank()) add("El nombre de la mascota no puede estar vacio")
        if (vacunas.isEmpty()) add("Debe tener al menos una vacuna registrada")
        if (peso <= 0) add("El peso debe ser mayor que cero")
    }

    override fun validar() = esValido
}

fun main() {
    val ficha1 = FichaMedica("F001", "Max", listOf("Rabia", "Multiple"), 15.5)
    val ficha2 = FichaMedica("F002", "", emptyList(), -5.0)

    fun procesarIdentificable(s: Identificable) = println("-> ${s.serializar()}")
    fun procesarValidable(v: Validable) {
        println("Valido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarIdentificable(ficha1)
    procesarValidable(ficha1)
    procesarValidable(ficha2)
}
