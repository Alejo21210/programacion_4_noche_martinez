fun main() {
    println("If con condiciones anidadas - Clinica Veterinaria")
    print("La mascota tiene antecedentes de alergias? s/n ")
    val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"
    println("Frecuencia cardiaca lpm:")
    val frecuencia = readLine()?.toIntOrNull() ?: 0
    if (tieneAntecedentes) {
        println("Mascota con antecedentes de alergias")
        if (frecuencia < 60) {
            println("Bradicardia - monitoreo urgente")
        } else if (frecuencia > 120) {
            println("Taquicardia - evaluar medicacion")
        } else {
            println("Frecuencia dentro del rango normal")
        }
    } else {
        println("Mascota sin antecedentes alergicos")
        if (frecuencia < 70 || frecuencia > 140) {
            println("Frecuencia fuera de lo normal")
        } else {
            println("Frecuencia cardiaca normal")
        }
    }
}
