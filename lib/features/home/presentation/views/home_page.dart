import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/bloc/home_bloc.dart';
import 'package:task3/features/home/presentation/bloc/home_state.dart';
import 'package:task3/features/home/presentation/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        key: scaffoldKey,
        drawer: DrawerWidget(
          name: state.currentUserName,
          isSuperUser: state.isSuperUser,
          image: state.currentUserImage,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => scaffoldKey.currentState!.openDrawer(),
                  icon: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: state.currentUserImage,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Welcome\n${state.currentUserName}',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
