fun main() {
    println("CILCOS for")
    for (i in 1..5){
        println(i)
    }
    println("until")
    for (i in 1 until 5){
        println(i)
    }
    println("listas")
    val nombres= listOf("Ana", "Luis", "Juana")
    for (nombre in nombres){
        println(nombre)
    }
    println("indice valor")
    for ((index, valor) in nombres.withIndex()){
        println("$index, $valor")
    }
    
    println("break")
    for (i in 1..5){
        if(i==3){
            break
        }
            println(i)
    }
    println("Continue")
    for (i in 1..5){
        if(i==3){
            continue
        }
            println(i)
    }
}