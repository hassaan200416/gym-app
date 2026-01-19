/// Customizable text input field with built-in validation support.
/// 
/// Supports:
/// - Standard text input
/// - Password input (obscured text)
/// - Numeric input with digit-only filtering
/// - Custom keyboard types
/// - Form validation integration
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isNumber;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.isNumber = false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType ??
          (isNumber ? TextInputType.number : TextInputType.text),
      inputFormatters:
          isNumber ? [FilteringTextInputFormatter.digitsOnly] : const [],
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: validator,
    );
  }
}
