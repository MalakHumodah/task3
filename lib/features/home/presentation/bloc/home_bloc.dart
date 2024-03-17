import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/core/constants/const_img.dart';
import 'package:task3/features/home/data/home_data_source.dart';
import 'package:task3/features/home/presentation/bloc/home_event.dart';
import 'package:task3/features/home/presentation/bloc/home_state.dart';
import '../../../../core/constants/keys.dart';
import '../../../../services/shared_service.dart';
import '../../../splash/presentation/views/splash_page.dart';
import '../../data/user_info_model.dart';
import '../views/all_users_screen.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<Logout>(_logout);
    on<GetUserInfo>(_getUserInfo);
    on<GetAllUser>(_getAllUser);

    add(GetUserInfo());
  }

  Future<FutureOr<void>> _logout(
    Logout event,
    Emitter<HomeState> emit,
  ) async {
    await Prefs.setBool(loginStateKey, false);
    Navigator.pushAndRemoveUntil(
      navigatorAppKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
      (route) => false,
    );
  }

  FutureOr<void> _getUserInfo(
      GetUserInfo event, Emitter<HomeState> emit) async {
    final String? name = Prefs.getString(currentUserNameKey);
    String? image = Prefs.getString(currentUserImageKey);

    if (image == null || image.isEmpty) {
      emit(
        state.copyWith(currentUserImage: unKnownUserImage),
      );
    }
    emit(
      state.copyWith(
        currentUserName: name,
        currentUserImage: image,
        isSuperUser: Prefs.getBool(superUserKey),
      ),
    );
  }

  FutureOr<FutureOr> _getAllUser(
      GetAllUser event, Emitter<HomeState> emit) async {
    HomeDataSource dataSource = HomeDataSource();

    final response = await dataSource.getInfo();
    List<UserInfoModel> allUsers = [];

    Map<String, dynamic> decodedBody = json.decode(response.body);

    if (decodedBody["statusCode"] == 200) {
      for (var json in decodedBody["data"]) {
        allUsers.add(UserInfoModel.fromJson(json));
      }
      emit(state.copyWith(allUsers: allUsers));

      Navigator.of(navigatorAppKey.currentContext!)
          .push(MaterialPageRoute(builder: (context) => AllUsersScreen()));
    } else {
      scaffoldGlobalKey.currentState!.showSnackBar(SnackBar(
          content: Text(
        decodedBody["errorMessage"],
      )));
    }
  }
}
