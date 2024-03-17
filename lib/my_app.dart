import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/bloc/home_bloc.dart';
import 'package:task3/features/login/presentation/bloc/login_bloc.dart';
import 'package:task3/features/splash/presentation/bloc/splash_bloc.dart';
import 'core/constants/keys.dart';
import 'features/splash/presentation/bloc/splash_event.dart';
import 'features/splash/presentation/views/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (BuildContext context) => SplashBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorAppKey,
        scaffoldMessengerKey: scaffoldGlobalKey,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
