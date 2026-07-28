package com.ute.techdash.navigation

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.ute.techdash.ui.permisos.PantallaConPermiso
import com.ute.techdash.ui.permisos.PantallaPermisos

object Rutas {
    const val PERMISO_UNICO = "permiso_unico"
    const val PERMISOS = "permisos"
}

@Composable
fun NavGraph(navController: NavHostController, modifier: Modifier = Modifier) {
    NavHost(
        navController = navController,
        startDestination = Rutas.PERMISO_UNICO,
        modifier = modifier
    ) {
        composable(Rutas.PERMISO_UNICO) { PantallaConPermiso() }
        composable(Rutas.PERMISOS) { PantallaPermisos() }
    }
}
