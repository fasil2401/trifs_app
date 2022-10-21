
import 'dart:convert';

ExploreGalleryModel exploreGalleryModelFromJson(String str) => ExploreGalleryModel.fromJson(json.decode(str));

String exploreGalleryModelToJson(ExploreGalleryModel data) => json.encode(data.toJson());

class ExploreGalleryModel {
    ExploreGalleryModel({
       required this.sts,
       required this.msg,
       required this.images,
    });

    String sts;
    String msg;
    List<Image> images;

    factory ExploreGalleryModel.fromJson(Map<String, dynamic> json) => ExploreGalleryModel(
        sts: json["sts"],
        msg: json["msg"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        this.id,
        this.type,
        this.placeId,
        this.image,
    });

    int? id;
    String? type;
    int? placeId;
    String? image;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        type: json["type"],
        placeId: json["place_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_id": placeId,
        "image": image,
    };
}
