import 'dart:convert';

ListPlacesModel listPlacesModelFromJson(String str) => ListPlacesModel.fromJson(json.decode(str));

String listPlacesModelToJson(ListPlacesModel data) => json.encode(data.toJson());

class ListPlacesModel {
    ListPlacesModel({
       required this.sts,
       required this.msg,
       required this.places,
    });

    String sts;
    String msg;
    List<Place> places;

    factory ListPlacesModel.fromJson(Map<String, dynamic> json) => ListPlacesModel(
        sts: json["sts"],
        msg: json["msg"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
    };
}

class Place {
    Place({
        this.id,
        this.name,
        this.subName,
        this.placeCode,
        this.duration,
        this.image,
        this.district,
        this.state,
    });

    int? id;
    String? name;
    String? subName;
    String? placeCode;
    String? duration;
    String? image;
    String? district;
    String? state;

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        name: json["name"],
        subName: json["sub_name"],
        placeCode: json["place_code"],
        duration: json["duration"],
        image: json["image"],
        district: json["district"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_name": subName,
        "place_code": placeCode,
        "duration": duration,
        "image": image,
        "district": district,
        "state": state,
    };
}

