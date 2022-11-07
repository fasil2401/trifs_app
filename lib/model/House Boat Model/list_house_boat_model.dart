import 'dart:convert';

ListHouseBoatModel listHouseBoatModelFromJson(String str) => ListHouseBoatModel.fromJson(json.decode(str));

String listHouseBoatModelToJson(ListHouseBoatModel data) => json.encode(data.toJson());

class ListHouseBoatModel {
    ListHouseBoatModel({
       required this.sts,
       required this.msg,
       required this.houseboats,
    });

    String sts;
    String msg;
    List<Houseboat> houseboats;

    factory ListHouseBoatModel.fromJson(Map<String, dynamic> json) => ListHouseBoatModel(
        sts: json["sts"],
        msg: json["msg"],
        houseboats: List<Houseboat>.from(json["houseboats"].map((x) => Houseboat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "houseboats": List<dynamic>.from(houseboats.map((x) => x.toJson())),
    };
}

class Houseboat {
    Houseboat({
        this.id,
        this.agencyId,
        this.name,
        this.contactNo,
        this.mailId,
        this.startPoint,
        this.endPoint,
        this.days,
        this.budget,
        this.offerAmount,
        this.advAmount,
        this.food,
        this.room,
        this.roomType,
        this.description,
        this.itinerary,
        this.district,
        this.state,
        this.country,
        this.status,
        this.image,
       required this.createdAt,
    });

    int? id;
    int? agencyId;
    String? name;
    String? contactNo;
    String? mailId;
    String? startPoint;
    String? endPoint;
    int? days;
    int? budget;
    int? offerAmount;
    int? advAmount;
    String? food;
    int? room;
    String? roomType;
    String? description;
    String? itinerary;
    String? district;
    String? state;
    String? country;
    String? status;
    String? image;
    DateTime createdAt;

    factory Houseboat.fromJson(Map<String, dynamic> json) => Houseboat(
        id: json["id"],
        agencyId: json["agency_id"],
        name: json["name"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        startPoint: json["start_point"],
        endPoint: json["end_point"],
        days: json["days"],
        budget: json["budget"],
        offerAmount: json["offer_amount"],
        advAmount: json["adv_amount"],
        food: json["food"],
        room: json["room"],
        roomType: json["room_type"],
        description: json["description"],
        itinerary: json["itinerary"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "name": name,
        "contact_no": contactNo,
        "mail_id": mailId,
        "start_point": startPoint,
        "end_point": endPoint,
        "days": days,
        "budget": budget,
        "offer_amount": offerAmount,
        "adv_amount": advAmount,
        "food": food,
        "room": room,
        "room_type": roomType,
        "description": description,
        "itinerary": itinerary,
        "district": district,
        "state": state,
        "country": country,
        "status": status,
        "image": image,
        "created_at": createdAt.toIso8601String(),
    };
}
