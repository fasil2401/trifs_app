import 'dart:convert';

SingleHouseBoatModel singleHouseBoatModelFromJson(String str) => SingleHouseBoatModel.fromJson(json.decode(str));

String singleHouseBoatModelToJson(SingleHouseBoatModel data) => json.encode(data.toJson());

class SingleHouseBoatModel {
    SingleHouseBoatModel({
       required this.sts,
       required this.msg,
       required this.houseboats,
       required this.agency,
    });

    String sts;
    String msg;
    Houseboats houseboats;
    Agency agency;

    factory SingleHouseBoatModel.fromJson(Map<String, dynamic> json) => SingleHouseBoatModel(
        sts: json["sts"],
        msg: json["msg"],
        houseboats: Houseboats.fromJson(json["houseboats"]),
        agency: Agency.fromJson(json["agency"]),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "houseboats": houseboats.toJson(),
        "agency": agency.toJson(),
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
       required this.createdAt,
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
    DateTime createdAt;

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
        "created_at": createdAt.toIso8601String(),
    };
}

class Houseboats {
    Houseboats({
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

    factory Houseboats.fromJson(Map<String, dynamic> json) => Houseboats(
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
