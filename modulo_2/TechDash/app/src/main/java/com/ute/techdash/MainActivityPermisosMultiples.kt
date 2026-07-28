package com.ute.techdash

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import com.ute.techdash.ui.permisos.PantallaPermisos
import com.ute.techdash.ui.theme.TechDashTheme

class MainActivityPermisosMultiples : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            TechDashTheme {
                PantallaPermisos(
                    onTodosConcedidos = { /* acá irá navController.navigate("dashboard") */ }
                )
            }
        }
    }
}
