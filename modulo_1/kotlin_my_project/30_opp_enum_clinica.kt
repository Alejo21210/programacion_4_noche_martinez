enum class EstadoSalud(val descripcion: String, val esCritico: Boolean) {
    SALUDABLE("Mascota en buen estado", false),
    OBSERVACION("Requiere monitoreo", false),
    EN_TRATAMIENTO("Recibiendo tratamiento", false),
    RECUPERADO("Finalizado con exito", true),
    CRITICO("Estado critico - atencion urgente", true),
    FALLECIDO("Mascota fallecida", true);

    fun puedeTransicionarA(siguiente: EstadoSalud): Boolean = when (this) {
        SALUDABLE -> siguiente == OBSERVACION || siguiente == EN_TRATAMIENTO
        OBSERVACION -> siguiente == EN_TRATAMIENTO || siguiente == SALUDABLE
        EN_TRATAMIENTO -> siguiente == RECUPERADO || siguiente == CRITICO
        else -> false
    }
}

fun main() {
    val estado = EstadoSalud.EN_TRATAMIENTO
    println(estado.descripcion)
    println(estado.esCritico)

    val mensaje = when (estado) {
        EstadoSalud.SALUDABLE -> "Puede irse a casa"
        EstadoSalud.OBSERVACION -> "En observacion"
        EstadoSalud.EN_TRATAMIENTO -> "Recibiendo medicacion"
        EstadoSalud.RECUPERADO -> "Listo para alta"
        EstadoSalud.CRITICO -> "Emergencia"
        EstadoSalud.FALLECIDO -> "Lo sentimos"
    }
    println(mensaje)

    println(estado.puedeTransicionarA(EstadoSalud.RECUPERADO))
}
