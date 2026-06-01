data class EspeciePago(val id: Int, val nombre: String)

data class Servicio(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val duracion: Int,
    val especie: EspeciePago,
    val activo: Boolean = true
) {
    val disponible: Boolean get() = activo && duracion > 0
    val precioConIva: Double get() = precio * 1.19

    fun aplicarDescuento(porcentaje: Double): Servicio {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object CatalogoServicios {
    private val especies = mutableListOf(
        EspeciePago(1, "Perro"),
        EspeciePago(2, "Gato"),
        EspeciePago(3, "Ave")
    )
    private val servicios = mutableListOf<Servicio>()
    private var siguienteId = 1

    fun agregarServicio(nombre: String, precio: Double, duracion: Int, especieId: Int): Servicio? {
        val especie = especies.find { it.id == especieId } ?: return null
        val servicio = Servicio(siguienteId++, nombre, precio, duracion, especie)
        servicios.add(servicio)
        return servicio
    }

    fun listar(): List<Servicio> = servicios.toList()
}

interface Pagable {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : Pagable {
    override val nombre = "Tarjeta de credito"
    override fun procesar(monto: Double): Boolean {
        println("Cargando $${"%.2f".format(monto)} a $numero")
        return true
    }
}

class PayPal(val email: String) : Pagable {
    override val nombre = "PayPal"
    override fun procesar(monto: Double): Boolean {
        println("Enviando $${"%.2f".format(monto)} a $email")
        return true
    }
}

class Efectivo : Pagable {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("Recibiendo $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

class Cheque(val numero: String, val banco: String) : Pagable {
    override val nombre = "Cheque"
    override fun procesar(monto: Double): Boolean {
        println("Procesando cheque No. $numero del banco $banco por $${"%.2f".format(monto)}")
        return true
    }
}

fun cobrar(monto: Double, metodoPago: Pagable) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "Pago exitoso\n" else "Pago fallido\n")
}

fun main() {
    CatalogoServicios.agregarServicio("Consulta general", 35.0, 30, 1)
    CatalogoServicios.agregarServicio("Vacunacion", 25.0, 20, 2)
    CatalogoServicios.agregarServicio("Peluqueria", 45.0, 60, 3)

    println("=== LISTADO DE SERVICIOS ===")
    val serviciosExistentes = CatalogoServicios.listar()
    for (s in serviciosExistentes) {
        println("SERVICIO: ${s.nombre.padEnd(20)} | PRECIO: $${s.precio}")
    }
    println("----------------------------------------\n")

    val metodos: List<Pagable> = listOf(
        TarjetaCredito("**** **** **** 1234"),
        PayPal("duenio@test.com"),
        Efectivo(),
        Cheque("000-456", "Banco Pichincha")
    )

    println("=== PROCESANDO PAGOS ===")
    for (metodo in metodos) {
        cobrar(50.0, metodo)
    }
}
