fun main() {
    println("Contro de Flujo")
    println("If Simple")
    println("Temperatura corportal del paciente grados centig")
    val temperatura= readLine()?.toDoubleOrNull()?:35.5
    if(temperatura >=38){
        println("Fiebre detectado")
    }
    if(temperatura>=40){
        println("Fiebre alta")
    }
    println("Temperatura registrada: $temperatura")
}