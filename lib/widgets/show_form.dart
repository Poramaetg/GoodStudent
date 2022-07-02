// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changFunc;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        border: const OutlineInputBorder(),
        hintText: hint,
        suffixIcon: Icon(iconData),
      ),
      onChanged: changFunc,
    );
  }
}
