import 'dart:convert';

AttractionsListModel attractionsListModelFromJson(String str) => AttractionsListModel.fromJson(json.decode(str));

String attractionsListModelToJson(AttractionsListModel data) => json.encode(data.toJson());

class AttractionsListModel {
    AttractionsListModel({
        this.sts,
        this.msg,
        this.attractions,
    });

    String? sts;
    String? msg;
    List<Attraction>? attractions;

    factory AttractionsListModel.fromJson(Map<String, dynamic> json) => AttractionsListModel(
        sts: json["sts"],
        msg: json["msg"],
        attractions: List<Attraction>.from(json["attractions"].map((x) => Attraction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "attractions": List<dynamic>.from(attractions!.map((x) => x.toJson())),
    };
}

class Attraction {
    Attraction({
        this.id,
        this.name,
        this.subName,
        this.duration,
        this.image,
    });

    int? id;
    String? name;
    String? subName;
    String? duration;
    String? image;

    factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        id: json["id"],
        name: json["name"],
        subName: json["sub_name"],
        duration: json["duration"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_name": subName,
        "duration": duration,
        "image": image,
    };
}
