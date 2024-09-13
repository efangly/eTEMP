class User {
  String? message;
  bool? success;
  UserData? data;

  User({this.message, this.success, this.data});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? userId;
  String? wardId;
  String? userName;
  bool? userStatus;
  String? userLevel;
  String? displayName;
  String? userPic;

  UserData({this.userId, this.wardId, this.userName, this.userStatus, this.userLevel, this.displayName, this.userPic});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    wardId = json['wardId'];
    userName = json['userName'];
    userStatus = json['userStatus'];
    userLevel = json['userLevel'];
    displayName = json['displayName'];
    userPic = json['userPic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['wardId'] = wardId;
    data['userName'] = userName;
    data['userStatus'] = userStatus;
    data['userLevel'] = userLevel;
    data['displayName'] = displayName;
    data['userPic'] = userPic;
    return data;
  }
}
