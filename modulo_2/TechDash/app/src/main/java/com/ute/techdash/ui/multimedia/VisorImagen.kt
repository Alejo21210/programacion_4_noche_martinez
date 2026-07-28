package com.ute.techdash.ui.multimedia

import android.net.Uri
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import coil.compose.AsyncImage

@Composable
fun VisorImagen(uri: Uri, modifier: Modifier = Modifier) {
    AsyncImage(
        model = uri,
        contentDescription = "Imagen seleccionada",
        modifier = modifier,
        contentScale = ContentScale.Fit
    )
}
