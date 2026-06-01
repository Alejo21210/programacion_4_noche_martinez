fun main() {
    println("CICLOS while - Clinica Veterinaria")
    var contador = 1
    while (contador <= 5) {
        print("Mascota $contador, ")
        contador++
    }
    contador = 1
    do {
        println("Procesando pago mascota #$contador")
        contador++
    } while (contador <= 5)

    println("brake - continue")
    contador = 1
    while (contador <= 10) {
        contador++
        if (contador == 3) continue
        if (contador == 7) break
        println("Atendiendo mascota #$contador")
    }

    var input: String
    while (true) {
        println("Escribe 'salir' para terminar la jornada:")
        input = readLine() ?: ""
        if (input == "salir") break
        println("Ingresaste $input")
    }
}
