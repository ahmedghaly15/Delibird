class UserModel {
  String? name;
  String? email;
  String? uId;
  String? password;
  String? phoneNumber;

  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'uId': uId,
    };
  }
}
