import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/views/home_page.dart';
import 'package:task3/features/splash/presentation/bloc/splash_event.dart';
import 'package:task3/features/splash/presentation/bloc/splash_state.dart';
import 'package:task3/services/shared_service.dart';
import '../../../../core/constants/keys.dart';
import '../../../login/presentation/views/login_page.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<LoadData>(_loadData);

    add(LoadData());
  }

  FutureOr<FutureOr> _loadData(
      LoadData event, Emitter<SplashState> emit) async {
    bool? loginState = Prefs.getBool(loginStateKey);

    await Future.delayed(Duration(seconds: 3));

    if (loginState == true) {
      Navigator.of(navigatorAppKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } else {
      Navigator.of(navigatorAppKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }
  }
}
