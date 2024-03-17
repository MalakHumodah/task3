import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/widgets/user_info_widget.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(
      {super.key,
      required this.isSuperUser,
      required this.name,
      required this.image});

  final bool isSuperUser;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          if (isSuperUser)
            ListTile(
              title: Text(
                'All Users',
              ),
              onTap: () {
                Navigator.pop(context);
                context.read<HomeBloc>().add(GetAllUser());
              },
            ),
          ListTile(
            title: Text('User Info'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserInfoWidget(
                            name: name,
                            superUser: isSuperUser,
                            img: image,
                          )));
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              context.read<HomeBloc>().add(Logout());
            },
          ),
        ],
      ),
    );
  }
}
