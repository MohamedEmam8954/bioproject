import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.validator,
    this.onchange,
    this.onsubmit,
    required this.hinttext,
    this.inputType,
    this.obscuretext = false,
    this.ontap,
  }) : super(key: key);

  final String? Function(String? value)? validator;
  final void Function(String)? onchange;
  final Function(String value)? onsubmit;
  final String hinttext;
  final TextInputType? inputType;
  final bool obscuretext;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(color: Colors.black),
      keyboardType: inputType,
      onFieldSubmitted: onsubmit,
      onChanged: onsubmit,
      validator: validator,
      obscureText: obscuretext,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
