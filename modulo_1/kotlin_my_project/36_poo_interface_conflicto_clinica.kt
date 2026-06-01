interface A { fun atender() = println("Atendiendo como consulta general") }
interface B { fun atender() = println("Atendiendo como urgencia") }

class VeterinarioTurno : A, B {
    override fun atender() {
        super<A>.atender()
        super<B>.atender()
        println("Derivando a especialista segun diagnostico")
    }
}

fun main() {
    val vet = VeterinarioTurno()
    vet.atender()
}
