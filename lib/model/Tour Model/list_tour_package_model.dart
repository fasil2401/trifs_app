import 'dart:convert';

TourPackagesModel tourPackagesModelFromJson(String str) => TourPackagesModel.fromJson(json.decode(str));

String tourPackagesModelToJson(TourPackagesModel data) => json.encode(data.toJson());

class TourPackagesModel {
    TourPackagesModel({
        this.sts,
        this.msg,
        this.packages,
    });

    String? sts;
    String? msg;
    List<Package>? packages;

    factory TourPackagesModel.fromJson(Map<String, dynamic> json) => TourPackagesModel(
        sts: json["sts"],
        msg: json["msg"],
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
    };
}

class Package {
    Package({
        this.id,
        this.agencyId,
        this.catId,
        this.name,
        this.searchTags,
        this.contactNo,
        this.mailId,
        this.days,
        this.desc,
        this.inclusion,
        this.exclusion,
        this.avgAmount,
        this.offerAmount,
        this.advAmount,
        this.vechicleDetails,
        this.cancelationPolicy,
        this.image,
        this.status,
        this.createdAt,
    });

    dynamic id;
    dynamic agencyId;
    dynamic catId;
    String? name;
    String? searchTags;
    String? contactNo;
    String? mailId;
    String? days;
    String? desc;
    String? inclusion;
    String? exclusion;
    dynamic avgAmount;
    dynamic offerAmount;
    dynamic advAmount;
    String? vechicleDetails;
    String? cancelationPolicy;
    String? image;
    String? status;
    String? createdAt;

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        agencyId: json["agency_id"],
        catId: json["cat_id"],
        name: json["name"],
        searchTags: json["search_tags"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        days: json["days"],
        desc: json["desc"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        avgAmount: json["avg_amount"],
        offerAmount: json["offer_amount"],
        advAmount: json["adv_amount"],
        vechicleDetails: json["vechicle_details"],
        cancelationPolicy: json["cancelation_policy"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "cat_id": catId,
        "name": name,
        "search_tags": searchTags,
        "contact_no": contactNo,
        "mail_id": mailId,
        "days": days,
        "desc": desc,
        "inclusion": inclusion,
        "exclusion": exclusion,
        "avg_amount": avgAmount,
        "offer_amount": offerAmount,
        "adv_amount": advAmount,
        "vechicle_details": vechicleDetails,
        "cancelation_policy": cancelationPolicy,
        "image": image,
        "status": status,
        "created_at": createdAt,
    };
}
