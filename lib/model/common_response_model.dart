import 'dart:convert';

CommonResponseModel commonResponseModelFromJson(String str) =>
    CommonResponseModel.fromJson(json.decode(str));

String commonResponseModelToJson(CommonResponseModel data) =>
    json.encode(data.toJson());

class CommonResponseModel {
  CommonResponseModel({
    required this.sts,
    required this.msg,
  });

  String sts;
  String msg;

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonResponseModel(
        sts: json["sts"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
      };
}
