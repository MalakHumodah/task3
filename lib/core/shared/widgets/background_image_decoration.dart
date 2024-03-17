import 'package:flutter/cupertino.dart';
import '../../constants/const_colors.dart';
import '../../constants/const_sizes.dart';

Widget backgroundImage(){
  return Align(
    widthFactor: 0.2,
    child: Image.asset(
      'assets/images/clover.png',
      color: secondColorTheme,
      height: largeImage,
    ),
  );
}


class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Align(
      // widthFactor: 0.2,
      child: Image.asset(
        'assets/images/clover.png',
        color: secondColorTheme,
        height: largeImage,
      ),
    );
  }
}
