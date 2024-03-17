class UserInfoModel {
  int? id;
  String? name;
  String? username;
  String? password;
  String? imageUrl;
  bool? superUser;

  UserInfoModel(
      {this.id,
      this.name,
      this.username,
      this.password,
      this.imageUrl,
      this.superUser});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        password: json['password'],
        imageUrl: json['imageUrl'],
        superUser: json['super_user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['password'] = password;
    data['imageUrl'] = imageUrl;
    data['super_user'] = superUser;
    return data;
  }
}
