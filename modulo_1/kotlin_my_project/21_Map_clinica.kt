fun main() {
    println("Map - Clinica Veterinaria")
    println("Inmutables")
    val duenios = mapOf(
        "Max" to "Carlos Lopez",
        "Luna" to "Maria Garcia",
        "Toby" to "Pedro Martinez",
        "Misi" to "Ana Perez"
    )
    println(duenios["Max"])
    println(duenios["Rocky"])
    println(duenios.getOrDefault("Max", "Desconocido"))
    println(duenios.getOrDefault("Rocky", "Desconocido"))
    println(duenios.keys)
    println(duenios.values)
    println(duenios)
    for ((mascota, duenio) in duenios) {
        println("mascota: $mascota, duenio: $duenio")
    }
    for (mascota in duenios.values) {
        println("duenio: $mascota")
    }
    println("Mutables")
    val inventarioMedicinas = mutableMapOf(
        "Amoxicilina" to 50,
        "Ivermectina" to 20,
        "Vitamina B" to 30,
        "Antipulgas" to 15
    )
    inventarioMedicinas["Vacuna Multiple"] = 25
    println(inventarioMedicinas)
    inventarioMedicinas["Amoxicilina"] = 45
    println(inventarioMedicinas)
    inventarioMedicinas.remove("Antipulgas")
    println(inventarioMedicinas)
    inventarioMedicinas.getOrPut("Desparasitante") { 40 }
    println(inventarioMedicinas)
    inventarioMedicinas.getOrPut("Analgesico") { 20 }
    println(inventarioMedicinas)
}
