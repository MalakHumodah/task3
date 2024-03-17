import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:task3/features/splash/presentation/bloc/splash_state.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_sizes.dart';
import '../../../../core/shared/widgets/background_image_decoration.dart';
import '../../../../core/shared/widgets/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: colorTheme,
        body: Stack(
          children: [
            backgroundImage(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Clover Club',
                    style: headlineTextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
