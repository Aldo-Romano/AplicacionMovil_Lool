import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Componentes/contenedor_campo.dart';
import 'package:aplicacion_movil_lool/constants.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}