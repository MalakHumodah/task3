import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/core/constants/const_img.dart';
import 'package:task3/features/home/presentation/views/home_page.dart';
import 'package:task3/features/login/data/login_data_source.dart';
import 'package:task3/features/login/presentation/bloc/login_event.dart';
import 'package:task3/services/shared_service.dart';
import '../../../../core/constants/keys.dart';
import '../../../home/data/user_info_model.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginState()) {
    on<GetUser>(_getUser);
    on<UpdateVisibility>(_updateVisibility);
    on<ResetData>(_resetData);

  }

  FutureOr<void> _getUser(GetUser event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginPageState: LoginPageState.loading));

    LoginDataSource dataSource = LoginDataSource();

    Map info = {
      'username': userNameController.text,
      'password': passwordController.text,
    };

    final response = await dataSource.login(
      info: info,
    );
    Map<String, dynamic> decoded = json.decode(response.body);

    if (decoded['statusCode'] == 200) {
      Map<String, dynamic> decoded = json.decode(response.body);
      UserInfoModel userInfoModel =
          UserInfoModel.fromJson(decoded["data"]['userInformation']);

      Prefs.setBool(loginStateKey, true);

      Prefs.setString(accessTokenKey, decoded["data"]["accessToken"]);

      Prefs.setString(currentUserNameKey, userInfoModel.name ?? 'UnKnown');

      Prefs.setBool(superUserKey, userInfoModel.superUser ?? false);

      Prefs.setString(
          currentUserImageKey, userInfoModel.imageUrl ?? unKnownUserImage);
      add(ResetData());
      emit(state.copyWith(loginPageState: LoginPageState.success));

      Navigator.of(navigatorAppKey.currentContext!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      emit(state.copyWith(loginPageState: LoginPageState.error));
      scaffoldGlobalKey.currentState!
          .showSnackBar(SnackBar(content: Text(decoded["errorMessage"])));
    }
  }



  FutureOr<void> _updateVisibility(
      UpdateVisibility event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      passwordIcon: !event.isVisible,
    ));
  }

  FutureOr<void> _resetData(ResetData event, Emitter<LoginState> emit) {
    userNameController.text = '';
    passwordController.text = '';
  }
}
