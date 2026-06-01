fun main() {
    println("Operadores Logicos - Clinica Veterinaria")
    val estaVacunado = true
    val tieneDesparasitacion = false
    val estaEsterilizado = true
    val estaEnfermo = false

    println("Operador And &&")
    println("$estaVacunado && $tieneDesparasitacion = ${estaVacunado && tieneDesparasitacion}")
    println("$estaVacunado && $estaEsterilizado = ${estaVacunado && estaEsterilizado}")

    println("Or Logico ||")
    println("$estaVacunado || $tieneDesparasitacion = ${estaVacunado || tieneDesparasitacion}")
    println("$estaVacunado || $estaEsterilizado = ${estaVacunado || estaEsterilizado}")
    println("$estaEnfermo || $tieneDesparasitacion = ${estaEnfermo || tieneDesparasitacion}")
    println("$estaEnfermo || $tieneDesparasitacion || $estaEsterilizado = ${estaEnfermo || tieneDesparasitacion || estaEsterilizado}")

    println("Not Logico !")
    println("! $estaVacunado = ${!estaVacunado}")
    println("! $estaEnfermo = ${!estaEnfermo}")

    val texto = readLine()
    println(texto)
}
