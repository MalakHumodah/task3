import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task3/core/constants/const_colors.dart';
import 'package:task3/core/shared/widgets/background_image_decoration.dart';
import 'package:task3/core/shared/widgets/text_style.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget(
      {super.key,
      required this.name,
      required this.superUser,
      required this.img});

  final String name;
  final bool superUser;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorTheme,
      ),
      backgroundColor: colorTheme,
      body: Stack(
        children: [
          BackGroundImage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                width: double.maxFinite,
                height: 500,
                color: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: img,
                        height: 200,
                        width: 150,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'PlayfairDisplay',
                            color: secondColorTheme,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      superUser
                          ? Text(
                              'Super User',
                              style: subTitleTextStyle(),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
