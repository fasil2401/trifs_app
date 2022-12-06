import 'dart:convert';

VideoListModel videoListModelFromJson(String str) => VideoListModel.fromJson(json.decode(str));

String videoListModelToJson(VideoListModel data) => json.encode(data.toJson());

class VideoListModel {
    VideoListModel({
        this.sts,
        this.msg,
        this.videos,
    });

    String? sts;
    String? msg;
    List<Video>? videos;

    factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
        sts: json["sts"],
        msg: json["msg"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
    };
}

class Video {
    Video({
        this.id,
        this.type,
        this.placeId,
        this.url,
    });

    int? id;
    String? type;
    int? placeId;
    String? url;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        type: json["type"],
        placeId: json["place_id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_id": placeId,
        "url": url,
    };
}
