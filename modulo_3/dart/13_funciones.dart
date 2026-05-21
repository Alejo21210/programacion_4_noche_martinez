//Funcion sin parametros y sin retorno
void saludar(){
  print('Hola mundo');
}
//Funcion con parametros y sin retorno
void saludoConParametro(String nombre) {
  print('Hola $nombre');
}
//Funcion sin parametros y con retorno
int obtenerNumero() {
  return 10;
}

//Funcion sin parametros y con retorno
int sumar(int a, int b) {
  return a+b;
}
// Funcion flecha (arrow function)
int multiplicar(int a, int b) => a*b;

//Funcion con parametros opcionales
void saludarOpcional(String nombre, [String apellido='Sin apellido']){
  print("Hola $nombre $apellido");
}

//Funcion con parametros nombrados
void registroCliente({
  required String nombre,
  required int edad,
}){
  print("Hola $nombre edad: $edad");
}
// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';
void main() {
  saludar();
  saludoConParametro('Pedro Perez');
  int numero = obtenerNumero();
  print(numero);
  print('el numero es: ${obtenerNumero()}');
  print('la suma: ${sumar(5, 5)}');
  print('la multiplicacion: ${multiplicar(5, 5)}');
  saludarOpcional('Alejo');
  saludarOpcional('Alejo', 'Martínez');
  registroCliente(
    nombre: 'Ana',
    edad: 22,
  );
  print(formatearPrecio(1299.9));  // $1299.90
  print(formatearPrecioSinTipo(1299.9));  // $1299.90
}