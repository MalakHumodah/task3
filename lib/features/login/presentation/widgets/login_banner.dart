import 'package:flutter/material.dart';

import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_sizes.dart';
import '../../../../core/shared/widgets/background_image_decoration.dart';
import '../../../../core/shared/widgets/text_style.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorTheme,
      width: double.maxFinite,
      height: 350,
      child: Stack(
        children: [
          backgroundImage(),
          Padding(
            padding: const EdgeInsets.only(
              left: 35.0,
              top: 90,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/clover.png',
                  color: Colors.white,
                  height: smallImage,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome',
                  style: headlineTextStyle(),
                ),
                Text(
                  'Sign in to continue',
                  style: subTitleTextStyle(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
