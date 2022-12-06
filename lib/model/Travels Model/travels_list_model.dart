import 'dart:convert';

TavelsListModel tavelsListModelFromJson(String str) => TavelsListModel.fromJson(json.decode(str));

String tavelsListModelToJson(TavelsListModel data) => json.encode(data.toJson());

class TavelsListModel {
    TavelsListModel({
        this.sts,
        this.msg,
        this.travels,
    });

    String? sts;
    String? msg;
    List<Travel>? travels;

    factory TavelsListModel.fromJson(Map<String, dynamic> json) => TavelsListModel(
        sts: json["sts"],
        msg: json["msg"],
        travels: List<Travel>.from(json["travels"].map((x) => Travel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "travels": List<dynamic>.from(travels!.map((x) => x.toJson())),
    };
}

class Travel {
    Travel({
        this.id,
        this.agencyId,
        this.catId,
        this.name,
        this.type,
        this.contactNo,
        this.mailId,
        this.seating,
        this.perDayAmount,
        this.perDayOfferAmount,
        this.perDayKm,
        this.kmAmount,
        this.perHourAmount,
        this.advAmount,
        this.pincode,
        this.area,
        this.district,
        this.state,
        this.country,
        this.image,
        this.status,
        this.createdAt,
    });

    int? id;
    int? agencyId;
    int? catId;
    String? name;
    String? type;
    String? contactNo;
    String? mailId;
    String? seating;
    int? perDayAmount;
    int? perDayOfferAmount;
    int? perDayKm;
    int? kmAmount;
    int? perHourAmount;
    int? advAmount;
    int? pincode;
    String? area;
    String? district;
    String? state;
    String? country;
    String? image;
    String? status;
    String? createdAt;

    factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        id: json["id"],
        agencyId: json["agency_id"],
        catId: json["cat_id"],
        name: json["name"],
        type: json["type"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        seating: json["seating"],
        perDayAmount: json["per_day_amount"],
        perDayOfferAmount: json["per_day_offer_amount"],
        perDayKm: json["per_day_km"],
        kmAmount: json["km_amount"],
        perHourAmount: json["per_hour_amount"],
        advAmount: json["adv_amount"],
        pincode: json["pincode"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "cat_id": catId,
        "name": name,
        "type": type,
        "contact_no": contactNo,
        "mail_id": mailId,
        "seating": seating,
        "per_day_amount": perDayAmount,
        "per_day_offer_amount": perDayOfferAmount,
        "per_day_km": perDayKm,
        "km_amount": kmAmount,
        "per_hour_amount": perHourAmount,
        "adv_amount": advAmount,
        "pincode": pincode,
        "area": area,
        "district": district,
        "state": state,
        "country": country,
        "image": image,
        "status": status,
        "created_at": createdAt,
    };
}
