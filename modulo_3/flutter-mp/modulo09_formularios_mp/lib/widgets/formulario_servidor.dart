import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey = GlobalKey<FormState>();

  final _ctrlNombre = TextEditingController();
  final _ctrlEspecie = TextEditingController();
  final _ctrlEdad = TextEditingController();
  final _ctrlMotivo = TextEditingController();
  final _ctrlVeterinario = TextEditingController();

  final _focusEspecie = FocusNode();
  final _focusEdad = FocusNode();
  final _focusMotivo = FocusNode();
  final _focusVeterinario = FocusNode();

  String _tipoAtencion = 'Consulta';
  bool _urgente = false;

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlEspecie.dispose();
    _ctrlEdad.dispose();
    _ctrlMotivo.dispose();
    _ctrlVeterinario.dispose();
    _focusEspecie.dispose();
    _focusEdad.dispose();
    _focusMotivo.dispose();
    _focusVeterinario.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre': _ctrlNombre.text,
      'especie': _ctrlEspecie.text,
      'edad': _ctrlEdad.text,
      'motivo': _ctrlMotivo.text,
      'veterinario': _ctrlVeterinario.text,
      'tipo': _tipoAtencion,
      'urgente': _urgente.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText: 'Nombre del paciente',
              hintText: 'Luna',
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusEspecie.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 2) return 'M?nimo 2 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlEspecie,
            focusNode: _focusEspecie,
            decoration: const InputDecoration(
              labelText: 'Especie',
              hintText: 'Perro',
              prefixIcon: Icon(Icons.category),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusEdad.requestFocus(),
            validator: (v) => v == null || v.trim().isEmpty ? 'La especie es obligatoria' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlEdad,
            focusNode: _focusEdad,
            decoration: const InputDecoration(
              labelText: 'Edad',
              hintText: '3 a?os',
              prefixIcon: Icon(Icons.cake),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMotivo.requestFocus(),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlMotivo,
            focusNode: _focusMotivo,
            decoration: const InputDecoration(
              labelText: 'Motivo de consulta',
              hintText: 'Vacunacion',
              prefixIcon: Icon(Icons.medical_information),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusVeterinario.requestFocus(),
            validator: (v) => v == null || v.trim().isEmpty ? 'Indica el motivo' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlVeterinario,
            focusNode: _focusVeterinario,
            decoration: const InputDecoration(
              labelText: 'Veterinario responsable',
              hintText: 'Dra. Sofia',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            validator: (v) => v == null || v.trim().isEmpty ? 'El veterinario es obligatorio' : null,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _tipoAtencion,
            decoration: const InputDecoration(
              labelText: 'Tipo de atenci?n',
              prefixIcon: Icon(Icons.local_hospital),
              border: OutlineInputBorder(),
            ),
            items: ['Consulta', 'Vacunacion', 'Cirugia', 'Peluqueria']
                .map((tipo) => DropdownMenuItem(value: tipo, child: Text(tipo)))
                .toList(),
            onChanged: (v) => setState(() => _tipoAtencion = v!),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Necesita atenci?n urgente'),
            subtitle: const Text('Marcar si requiere seguimiento inmediato'),
            value: _urgente,
            onChanged: (v) => setState(() => _urgente = v),
            secondary: const Icon(Icons.warning_amber),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () => _formKey.currentState?.reset(), child: const Text('Limpiar')),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar ficha'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
