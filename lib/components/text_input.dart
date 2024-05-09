import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      this.textController,
      this.hint,
      this.iconLeft,
      this.isPassword = false,
      this.iconRight,
      this.type});
  final TextEditingController? textController;
  final String? hint;
  final Widget? iconLeft;
  final bool isPassword;
  final Widget? iconRight;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F4F4),
      height: 57,
      child: Column(
        children: [
          TextField(
            obscureText: isPassword,
            controller: textController,
            keyboardType: type,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  left: 15, bottom: 11, top: 11, right: 15),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF3B3B3B),
              ),
              prefixIcon: iconLeft,
              suffixIcon: iconRight,
            ),
          )
        ],
      ),
    );
  }
}
