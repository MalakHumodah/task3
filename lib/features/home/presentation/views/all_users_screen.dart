import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/core/constants/const_colors.dart';
import 'package:task3/core/constants/const_img.dart';
import 'package:task3/core/shared/widgets/text_style.dart';
import 'package:task3/features/home/data/user_info_model.dart';
import 'package:task3/features/home/presentation/bloc/home_bloc.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return userInfoCard(context.read<HomeBloc>().state.allUsers[index]);
        },
        itemCount: context.read<HomeBloc>().state.allUsers.length,
      ),
    );
  }
}

Widget userInfoCard(UserInfoModel userModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
    child: Card(
      color: secondColorTheme,
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: userModel.imageUrl ?? unKnownUserImage,
              height: 100,
              width: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User : ${userModel.id}',
                  style: subTitleTextStyle(),
                ),
                Text(
                  'Name : ${userModel.name}',
                  style: subTitleTextStyle(color: Colors.black54),
                ),
                Text(
                  userModel.superUser! ? 'Super User' : 'Not Super User',
                  style: subTitleTextStyle(color: Colors.black54),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
