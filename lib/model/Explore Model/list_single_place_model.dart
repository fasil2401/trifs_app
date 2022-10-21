import 'dart:convert';

ListSinglePlaceModel listSinglePlaceModelFromJson(String str) =>
    ListSinglePlaceModel.fromJson(json.decode(str));

String listSinglePlaceModelToJson(ListSinglePlaceModel data) =>
    json.encode(data.toJson());

class ListSinglePlaceModel {
  ListSinglePlaceModel({
    required this.sts,
    required this.msg,
    required this.place,
    required this.nearbyPlaces,
    required this.similarPlaces,
    required this.attractions,
  });

  String sts;
  String msg;
  Place place;
  List<dynamic> nearbyPlaces;
  List<dynamic> similarPlaces;
  List<Place> attractions;

  factory ListSinglePlaceModel.fromJson(Map<String, dynamic> json) =>
      ListSinglePlaceModel(
        sts: json["sts"],
        msg: json["msg"],
        place: Place.fromJson(json["place"]),
        nearbyPlaces: List<dynamic>.from(json["nearby_places"].map((x) => x)),
        similarPlaces: List<dynamic>.from(json["similar_places"].map((x) => x)),
        attractions:
            List<Place>.from(json["attractions"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "place": place.toJson(),
        "nearby_places": List<dynamic>.from(nearbyPlaces.map((x) => x)),
        "similar_places": List<dynamic>.from(similarPlaces.map((x) => x)),
        "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
      };
}

class Place {
  Place({
    this.id,
    this.placeId,
    this.name,
    this.subName,
    this.searchTags,
    this.nearby,
    this.similar,
    this.address,
    this.desc,
    this.history,
    this.healthIndexing,
    this.duration,
    this.googlemapLink,
    this.area,
    this.pincode,
    this.district,
    this.state,
    this.image,
    this.backImage,
    this.status,
    required this.createdAt,
    this.placeCode,
    this.nearbyPlaces,
    this.similarPlaces,
    this.country,
    this.topDestination,
  });

  int? id;
  int? placeId;
  String? name;
  String? subName;
  String? searchTags;
  String? nearby;
  String? similar;
  String? address;
  String? desc;
  String? history;
  String? healthIndexing;
  String? duration;
  String? googlemapLink;
  String? area;
  String? pincode;
  String? district;
  String? state;
  String? image;
  String? backImage;
  String? status;
  DateTime createdAt;
  String? placeCode;
  String? nearbyPlaces;
  String? similarPlaces;
  String? country;
  String? topDestination;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        placeId: json["place_id"] == null ? null : json["place_id"],
        name: json["name"],
        subName: json["sub_name"],
        searchTags: json["search_tags"],
        nearby: json["nearby"] == null ? null : json["nearby"],
        similar: json["similar"] == null ? null : json["similar"],
        address: json["address"],
        desc: json["desc"],
        history: json["history"],
        healthIndexing: json["health_indexing"],
        duration: json["duration"],
        googlemapLink: json["googlemap_link"],
        area: json["area"],
        pincode: json["pincode"],
        district: json["district"],
        state: json["state"],
        image: json["image"],
        backImage: json["back_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        placeCode: json["place_code"] == null ? null : json["place_code"],
        nearbyPlaces:
            json["nearby_places"] == null ? null : json["nearby_places"],
        similarPlaces:
            json["similar_places"] == null ? null : json["similar_places"],
        country: json["country"] == null ? null : json["country"],
        topDestination:
            json["top_destination"] == null ? null : json["top_destination"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place_id": placeId,
        "name": name,
        "sub_name": subName,
        "search_tags": searchTags,
        "nearby": nearby,
        "similar": similar,
        "address": address,
        "desc": desc,
        "history": history,
        "health_indexing": healthIndexing,
        "duration": duration,
        "googlemap_link": googlemapLink,
        "area": area,
        "pincode": pincode,
        "district": district,
        "state": state,
        "image": image,
        "back_image": backImage,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "place_code": placeCode,
        "nearby_places": nearbyPlaces,
        "similar_places": similarPlaces,
        "country": country,
        "top_destination": topDestination,
      };
}
