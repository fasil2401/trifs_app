import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.sts,
    required this.msg,
    this.user,
  });

  String sts;
  String msg;
  User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        sts: json["sts"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.pincode,
    this.area,
    this.district,
    this.state,
    this.address,
    this.joinOn,
  });

  int? id;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? pincode;
  String? area;
  String? district;
  String? state;
  String? address;
  String? joinOn;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        pincode: json["pincode"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        address: json["address"],
        joinOn: json["join_on"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "pincode": pincode,
        "area": area,
        "district": district,
        "state": state,
        "address": address,
        "join_on": joinOn,
      };
}
