import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, this.textController, this.hint});
  final TextEditingController? textController;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F4F4),
      height: 57,
      child: Column(
        children: [
          TextField(
            controller: textController,
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
            ),
          )
        ],
      ),
    );
  }
}
