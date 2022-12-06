import 'dart:convert';

TravelsSingleModel travelsSingleModelFromJson(String str) => TravelsSingleModel.fromJson(json.decode(str));

String travelsSingleModelToJson(TravelsSingleModel data) => json.encode(data.toJson());

class TravelsSingleModel {
    TravelsSingleModel({
        this.sts,
        this.msg,
        this.travel,
        this.agency,
    });

    String? sts;
    String? msg;
    Travel? travel;
    Agency?agency;

    factory TravelsSingleModel.fromJson(Map<String, dynamic> json) => TravelsSingleModel(
        sts: json["sts"],
        msg: json["msg"],
        travel: Travel.fromJson(json["travel"]),
        agency: Agency.fromJson(json["agency"]),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "travel": travel == null ? null : travel!.toJson(),
        "agency": agency == null ? null : agency!.toJson(),
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

    int? id;
    int? agentId;
    String? plan;
    int? walletBalence;
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
    String? createdAt;

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
        createdAt: json["created_at"],
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
        "created_at": createdAt,
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
