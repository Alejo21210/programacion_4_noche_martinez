data class Especie(val id: Int, val nombre: String)

data class PacienteRegistrado(
    val id: Int,
    val nombre: String,
    val edad: Int,
    val peso: Double,
    val especie: Especie,
    val activo: Boolean = true
) {
    val necesitaVacuna: Boolean get() = activo && edad >= 2
    val dosisRecomendada: Double get() = peso * 0.1

    fun aplicarDescuento(porcentaje: Double): PacienteRegistrado {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(peso = peso * (1 - porcentaje / 100))
    }
}

object RegistroPacientes {
    private val especies = mutableListOf(
        Especie(1, "Perro"),
        Especie(2, "Gato"),
        Especie(3, "Ave")
    )
    private val pacientes = mutableListOf<PacienteRegistrado>()
    private var siguienteId = 1

    fun registrarPaciente(nombre: String, edad: Int, peso: Double, especieId: Int): PacienteRegistrado? {
        val especie = especies.find { it.id == especieId } ?: return null
        val paciente = PacienteRegistrado(siguienteId++, nombre, edad, peso, especie)
        pacientes.add(paciente)
        return paciente
    }

    fun listar(): List<PacienteRegistrado> = pacientes.toList()
    fun vacunar(): List<PacienteRegistrado> = pacientes.filter { it.necesitaVacuna }
    fun porEspecie(id: Int): List<PacienteRegistrado> = pacientes.filter { it.especie.id == id }
    fun buscar(query: String): List<PacienteRegistrado> =
        pacientes.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    RegistroPacientes.registrarPaciente("Max", 5, 15.0, 1)
    RegistroPacientes.registrarPaciente("Luna", 1, 4.5, 2)
    RegistroPacientes.registrarPaciente("Toby", 8, 25.0, 1)
    RegistroPacientes.registrarPaciente("Piolin", 2, 0.15, 3)
    RegistroPacientes.registrarPaciente("Rocky", 3, 30.0, 1)

    println("=== Todos los pacientes ===")
    RegistroPacientes.listar().forEach { p ->
        val estado = if (p.necesitaVacuna) "Pendiente vacuna" else "Al dia"
        println("${p.nombre} - ${p.especie.nombre} - $estado (Dosis: ${"%.2f".format(p.dosisRecomendada)} ml)")
    }

    println("\n=== Vacunacion pendiente ===")
    RegistroPacientes.vacunar()
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.dosisRecomendada)} ml") }

    for (paciente in RegistroPacientes.listar()) {
        println("Paciente: ${paciente.nombre} - Edad: ${paciente.edad} anios")
    }
}
