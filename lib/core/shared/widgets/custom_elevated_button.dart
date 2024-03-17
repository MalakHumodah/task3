import 'package:flutter/material.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../../core/shared/widgets/text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.txt});

  final String txt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorTheme),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 100),
          child: Text(
            txt,
            style: subTitleTextStyle(),
          ),
        ),
      ),
    );
  }
}
