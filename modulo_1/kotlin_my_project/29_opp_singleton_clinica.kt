object ConfiguracionClinica {
    val nombre: String = "Patitas Felices"
    val direccion: String = "Av. Principal 123"
    private val horario: String = "Lun-Vie 9:00-18:00"

    fun infoClinica() = "$nombre - $direccion"
    fun obtenerHorario() = horario
}

class Veterinario private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        fun crear(nombre: String, especialidad: String): Veterinario? {
            if (nombre.isBlank() || especialidad.isBlank()) return null
            return Veterinario(++contadorId, nombre.trim())
        }

        const val TURNO_DEFECTO = "Matutino"
    }
}

fun main() {
    println(ConfiguracionClinica.infoClinica())

    val v = Veterinario.crear("Dra. Maria", "Cirugia")
    println(v)
}
