fun main() {
    val pesoPerro1 = 10.0
    val pesoPerro2 = 2.0
    println("Suma de pesos")
    println("$pesoPerro1 + $pesoPerro2 = ${pesoPerro1 + pesoPerro2}")
    println("Resta de pesos")
    println("$pesoPerro1 - $pesoPerro2 = ${pesoPerro1 - pesoPerro2}")
    println("Multiplicacion de dosis")
    println("$pesoPerro1 * $pesoPerro2 = ${pesoPerro1 * pesoPerro2}")
    println("Division de raciones")
    println("$pesoPerro1 / $pesoPerro2 = ${pesoPerro1 / pesoPerro2}")
    println("Modulo de alimento")
    println("$pesoPerro1 % $pesoPerro2 = ${pesoPerro1 % pesoPerro2}")
    println("Operadores de Asignacion Compuesta")
    var racionDiaria = 10.0
    racionDiaria += 5.0
    println("racionDiaria += 5.0 ${racionDiaria}")
    racionDiaria -= 3.0
    println("racionDiaria -= 3.0 ${racionDiaria}")
    racionDiaria *= 2.0
    println("racionDiaria *= 2.0 ${racionDiaria}")
    racionDiaria /= 4.0
    println("racionDiaria /= 4.0 ${racionDiaria}")
    racionDiaria %= 4.0
    println("racionDiaria %= 4.0 ${racionDiaria}")

    var contadorVisitas = 0
    contadorVisitas++
    println("contadorVisitas++ ${contadorVisitas}")
    println("contadorVisitas-- ${contadorVisitas}")
}
