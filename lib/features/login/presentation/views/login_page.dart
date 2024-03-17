import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/login/presentation/bloc/login_bloc.dart';
import 'package:task3/features/login/presentation/bloc/login_state.dart';
import 'package:task3/features/login/presentation/widgets/login_banner.dart';
import '../../../../core/shared/widgets/custom_elevated_button.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../bloc/login_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, state) {
        log('login state : ${state.loginPageState}');
        if (state.loginPageState == LoginPageState.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            body: Form(
              key: context.read<LoginBloc>().formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginBanner(),
                    SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      controller: context.read<LoginBloc>().userNameController,
                      txt: 'User Name',
                      obscureText: false,
                      isVisible: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: context.read<LoginBloc>().passwordController,
                      txt: 'Password',
                      obscureText: true,
                      isVisible: state.passwordIcon,
                      onTap: () {
                        context.read<LoginBloc>().add(
                            UpdateVisibility(isVisible: state.passwordIcon));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (context
                            .read<LoginBloc>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<LoginBloc>().add(GetUser());
                        }
                      },
                      txt: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
