fun main() {
    println("Registro de Mascota")
    println("Escriba el nombre de la mascota:")
    val nombre = readLine() ?: "desconocido"
    println("Hola $nombre")

    println("Escriba la edad de la mascota:")
    val edad = readLine()?.toDoubleOrNull() ?: 0.00
    println("La edad es: $edad anios")

    val doble = edad * 2
    println("El doble de edad es: ${doble}")
    println("El doble de edad es: ${edad * 2}")
}
