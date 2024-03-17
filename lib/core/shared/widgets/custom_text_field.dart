import 'package:flutter/material.dart';
import 'package:task3/core/constants/const_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.txt,
    required this.obscureText,
    required this.isVisible,
    this.onTap,
  });

  final TextEditingController controller;
  final String txt;
  final bool obscureText;
  final bool isVisible;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      txt,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          fontFamily: 'Exo',
                          color: secondColorTheme),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: isVisible,
                  controller: controller,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter the $txt ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: obscureText
                        ? InkWell(
                            onTap: onTap,
                            child: isVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorTheme,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: txt,
                    labelStyle: TextStyle(color: colorTheme),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


