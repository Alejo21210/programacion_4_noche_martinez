fun main() {
    println("If con multiples condiciones - Clinica Veterinaria")
    println("Edad de la mascota en anios:")
    val edad = readLine()?.toIntOrNull() ?: 0
    val clasificacion = if (edad < 1) {
        "Cachorro"
    } else if (edad <= 7) {
        "Adulto"
    } else if (edad <= 12) {
        "Senior"
    } else {
        "Geriatrico"
    }
    println("Clasificacion: $clasificacion")
}
