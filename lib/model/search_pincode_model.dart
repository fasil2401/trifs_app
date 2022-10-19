import 'dart:convert';

SearchPincodeModel searchPincodeModelFromJson(String str) => SearchPincodeModel.fromJson(json.decode(str));

String searchPincodeModelToJson(SearchPincodeModel data) => json.encode(data.toJson());

class SearchPincodeModel {
    SearchPincodeModel({
       required this.sts,
       required this.msg,
       required this.pincodes,
    });

    String sts;
    String msg;
    List<Pincode> pincodes;

    factory SearchPincodeModel.fromJson(Map<String, dynamic> json) => SearchPincodeModel(
        sts: json["sts"],
        msg: json["msg"],
        pincodes: List<Pincode>.from(json["pincodes"].map((x) => Pincode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "pincodes": List<dynamic>.from(pincodes.map((x) => x.toJson())),
    };
}

class Pincode {
    Pincode({
        this.id,
        this.city,
        this.pincode,
        this.district,
        this.state,
    });

    int? id;
    String? city;
    String? pincode;
    String? district;
    String? state;

    factory Pincode.fromJson(Map<String, dynamic> json) => Pincode(
        id: json["id"],
        city: json["city"],
        pincode: json["pincode"],
        district: json["district"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "pincode": pincode,
        "district": district,
        "state": state,
    };
}
