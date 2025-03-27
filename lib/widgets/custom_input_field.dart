import 'package:ecommerce_app/theme/const_colors.dart';
import 'package:ecommerce_app/theme/const_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.inputFormatters,
    this.focusNode,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: const TextStyle(
          color: customDarkGrey,
          fontSize: 16,
        ),
        filled: true,
        fillColor: customLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: customFieldBackground,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: customFieldBackground,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: customFieldBackground,
            width: 1.5,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: SvgPicture.asset(
            _obscureText ? eyeSleep : eyeOpen,
            width: 24,
            height: 24,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }
}
