import 'package:equatable/equatable.dart';

import '../../data/user_info_model.dart';

class HomeState extends Equatable {
  final String currentUserName;
  final String currentUserImage;
  final bool isSuperUser;
  final List<UserInfoModel> allUsers;

  const HomeState({
    this.isSuperUser = false,
    this.currentUserName = '',
    this.currentUserImage =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/434px-Unknown_person.jpg',
    this.allUsers = const [],
  });

  HomeState copyWith({
    String? currentUserName,
    String? currentUserImage,
    bool? isSuperUser,
    List<UserInfoModel>? allUsers,
  }) {
    return HomeState(
      currentUserName: currentUserName ?? this.currentUserName,
      currentUserImage: currentUserImage ?? this.currentUserImage,
      isSuperUser: isSuperUser ?? this.isSuperUser,
      allUsers: allUsers ?? this.allUsers,
    );
  }

  @override
  List<Object?> get props =>
      [currentUserName, isSuperUser, currentUserImage, allUsers];
}
