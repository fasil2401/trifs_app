import 'dart:convert';

TourPackageSingleModel tourPackageSingleModelFromJson(String str) => TourPackageSingleModel.fromJson(json.decode(str));

String tourPackageSingleModelToJson(TourPackageSingleModel data) => json.encode(data.toJson());

class TourPackageSingleModel {
    TourPackageSingleModel({
        this.sts,
        this.msg,
        this.package,
        this.agency,
    });

    String? sts;
    String? msg;
    Package? package;
    Agency? agency;

    factory TourPackageSingleModel.fromJson(Map<String, dynamic> json) => TourPackageSingleModel(
        sts: json["sts"],
        msg: json["msg"],
        package: Package.fromJson(json["package"]),
        agency: Agency.fromJson(json["agency"]),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "package": package!.toJson(),
        "agency": agency!.toJson(),
    };
}

class Agency {
    Agency({
        this.id,
        this.agentId,
        this.plan,
        this.walletBalence,
        this.name,
        this.email,
        this.mobile,
        this.phone,
        this.address,
        this.pincode,
        this.area,
        this.district,
        this.state,
        this.password,
        this.houseBoat,
        this.resort,
        this.onlyTravelling,
        this.camping,
        this.trucking,
        this.homeStay,
        this.tourPackages,
        this.abroadStudy,
        this.abroadJobs,
        this.status,
        this.logo,
        this.regPaper,
        this.idProof,
        this.idProof2,
        this.lisenceExpiry,
        this.createdAt,
    });

    dynamic id;
    dynamic agentId;
    String? plan;
    dynamic walletBalence;
    String? name;
    String? email;
    String? mobile;
    String? phone;
    String? address;
    String? pincode;
    String? area;
    String? district;
    String? state;
    String? password;
    String? houseBoat;
    String? resort;
    String? onlyTravelling;
    String? camping;
    String? trucking;
    String? homeStay;
    String? tourPackages;
    String? abroadStudy;
    String? abroadJobs;
    String? status;
    String? logo;
    String? regPaper;
    String? idProof;
    String? idProof2;
    dynamic lisenceExpiry;
    DateTime? createdAt;

    factory Agency.fromJson(Map<String, dynamic> json) => Agency(
        id: json["id"],
        agentId: json["agent_id"],
        plan: json["plan"],
        walletBalence: json["wallet_balence"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        phone: json["phone"],
        address: json["address"],
        pincode: json["pincode"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        password: json["password"],
        houseBoat: json["house_boat"],
        resort: json["resort"],
        onlyTravelling: json["only_travelling"],
        camping: json["camping"],
        trucking: json["trucking"],
        homeStay: json["home_stay"],
        tourPackages: json["tour_packages"],
        abroadStudy: json["abroad_study"],
        abroadJobs: json["abroad_jobs"],
        status: json["status"],
        logo: json["logo"],
        regPaper: json["reg_paper"],
        idProof: json["id_proof"],
        idProof2: json["id_proof2"],
        lisenceExpiry: json["lisence_expiry"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agent_id": agentId,
        "plan": plan,
        "wallet_balence": walletBalence,
        "name": name,
        "email": email,
        "mobile": mobile,
        "phone": phone,
        "address": address,
        "pincode": pincode,
        "area": area,
        "district": district,
        "state": state,
        "password": password,
        "house_boat": houseBoat,
        "resort": resort,
        "only_travelling": onlyTravelling,
        "camping": camping,
        "trucking": trucking,
        "home_stay": homeStay,
        "tour_packages": tourPackages,
        "abroad_study": abroadStudy,
        "abroad_jobs": abroadJobs,
        "status": status,
        "logo": logo,
        "reg_paper": regPaper,
        "id_proof": idProof,
        "id_proof2": idProof2,
        "lisence_expiry": lisenceExpiry,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
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
    DateTime? createdAt;

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
        createdAt: DateTime.parse(json["created_at"]),
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
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    };
}
