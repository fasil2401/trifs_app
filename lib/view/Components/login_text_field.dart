import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.isObscureText,
    required this.keyboardType,
    required this.prefixIcon,
  }) : super(key: key);

  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool isObscureText;
  final Function(String val) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.42),
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: isObscureText,
        decoration: InputDecoration(
          isCollapsed: true,
          hintStyle: TextStyle(fontSize: 15),
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(prefixIcon),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
