fun main() {
    println("Conversiones en Clinica Veterinaria")
    println("Entero a Numerico")
    val meses: Int = 24
    val anios: Double = meses.toDouble() / 12.0
    val mesesLong: Long = meses.toLong()
    val mesesString: String = meses.toString()

    println("Meses a anios: $anios")
    println("to Long: $mesesLong")
    println("to String: $mesesString")

    println("String a Numerico")
    val peso = "12.5".toDouble()
    val visitas = "3".toInt()

    val invalido = "abc".toIntOrNull()
    println(invalido)
}
