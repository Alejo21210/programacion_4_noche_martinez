class Duenio(val nombre: String, val email: String, val telefono: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        require(nombre.isNotBlank()) { "El nombre del duenio no puede estar vacio" }
        require(email.contains("@")) { "Email invalido: $email" }
        require(telefono.length >= 8) { "Telefono invalido" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail = email.substringAfter("@")
    }
}

fun main() {
    val d = Duenio("  Carlos Garcia  ", "carlos@veterinaria.com", "555-1234")
    println(d.nombreNormalizado)
    println(d.dominioEmail)
}
