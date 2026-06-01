open class Paciente(nombre: String, especie: String, pesoInicial: Double) {

    val nombre: String = nombre

    private var peso: Double = pesoInicial

    internal val idPaciente: String =
        "PET${(1000..9999).random()}"

    protected open fun calcularDosisDiaria(): Double = peso * 0.1

    fun registrarPeso(nuevoPeso: Double) {
        require(nuevoPeso > 0) { "El peso debe ser positivo" }
        peso = nuevoPeso
        println("Peso actualizado: $nuevoPeso kg | Estado: ${consultarEstado()}")
    }

    fun administrarMedicamento(dosis: Double): Boolean {
        require(dosis > 0) { "La dosis debe ser positiva" }
        if (dosis > peso * 0.5) {
            println("Dosis excede el limite seguro")
            return false
        }
        peso -= dosis * 0.01
        println("Medicamento administrado: ${dosis}ml | Peso actual: ${"%.2f".format(peso)} kg")
        return true
    }

    fun consultarEstado(): String = "${"%.2f".format(peso)} kg"
}

class PacienteHospitalizado(nombre: String, especie: String, pesoInicial: Double)
    : Paciente(nombre, especie, pesoInicial) {

    override fun calcularDosisDiaria(): Double {
        return super.calcularDosisDiaria() * 1.5
    }

    fun aplicarTratamiento() {
        val dosis = calcularDosisDiaria()
        administrarMedicamento(dosis)
    }
}

fun main() {
    val paciente = Paciente("Max", "Perro", 15.0)

    paciente.registrarPeso(16.0)
    paciente.administrarMedicamento(2.0)
    paciente.administrarMedicamento(10.0)

    println(paciente.nombre)
    println(paciente.consultarEstado())

    println("---- Paciente Hospitalizado ----")

    val hospitalizado = PacienteHospitalizado("Luna", "Gato", 4.5)
    hospitalizado.aplicarTratamiento()
    println(hospitalizado.consultarEstado())
}
