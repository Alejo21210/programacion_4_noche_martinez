fun main() {
    bienvenida()
    saludarMascota("Max")
    val precioConsulta = 25.0
    val precioVacuna = 15.0
    println("Total consulta + vacuna = $${calcularTotal(precioConsulta, precioVacuna)}")
    println("Diferencia precio = $${restar(precioConsulta, precioVacuna)}")
    operacion()
    println("Descuento del 10% = $${aplicarDescuento(precioConsulta, 10)}")
}

fun bienvenida() {
    println("Bienvenido a la Clinica Veterinaria")
}

fun saludarMascota(nombre: String) {
    println("Hola $nombre, el veterinario te atendera pronto")
}

fun calcularTotal(precio1: Double, precio2: Double): Double {
    return precio1 + precio2
}

fun restar(numero1: Double, numero2: Double) = numero1 - numero2

fun operacion() {
    fun dosisPorPeso(peso: Double): Double = peso * 0.1
    println(dosisPorPeso(15.0))
}

val aplicarDescuento = { precio: Double, porcentaje: Int -> precio - (precio * porcentaje / 100) }
