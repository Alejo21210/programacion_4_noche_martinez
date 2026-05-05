package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

class MainActivityHelloWorldd : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                EjemploHelloWorld()
            }
        }
    }
}

@Composable
fun EjemploHelloWorld() {
    // 'by remember' delega la lectura/escritura al objeto MutableState
    // 'mutableStateOf' crea estado observable: cuando cambia, Compose recompone
    var mensaje  by remember { mutableStateOf("¡Hola, Compose!") }
    var contador by remember { mutableStateOf(0) }

    // Column apila sus hijos verticalmente
    Column(
        modifier            = Modifier
            .fillMaxSize()          // ocupa todo el ancho y alto disponible
            .padding(24.dp),        // margen interior de 24dp en todos los lados
        verticalArrangement = Arrangement.Center,           // centra verticalmente
        horizontalAlignment = Alignment.CenterHorizontally  // centra horizontalmente
    ) {
        // Text muestra una cadena de texto en pantalla
        Text(
            text  = mensaje,
            style = MaterialTheme.typography.headlineMedium
        )

        Spacer(Modifier.height(16.dp))   // espacio vacío vertical

        Text(
            text  = "Botón presionado: $contador veces",
            style = MaterialTheme.typography.bodyLarge
        )

        Spacer(Modifier.height(24.dp))

        // Button ejecuta 'onClick' cuando el usuario lo presiona
        Button(onClick = {
            contador++
            mensaje = "¡Presionado $contador ${if (contador == 1) "vez" else "veces"}!"
        }) {
            Text("Presióname")
        }

        Spacer(Modifier.height(8.dp))

        // OutlinedButton: variante con borde, sin relleno
        OutlinedButton(onClick = {
            contador = 0
            mensaje  = "¡Hola, Compose!"
        }) {
            Text("Reiniciar")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun EjemploHelloWorldPreview() {
    MaterialTheme { EjemploHelloWorld() }
}