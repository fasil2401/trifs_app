import 'dart:convert';

ListAgencyModel listAgencyModelFromJson(String str) => ListAgencyModel.fromJson(json.decode(str));

String listAgencyModelToJson(ListAgencyModel data) => json.encode(data.toJson());

class ListAgencyModel {
    ListAgencyModel({
       required this.sts,
       required this.msg,
       required this.agency,
    });

    String sts;
    String msg;
    List<Agency> agency;

    factory ListAgencyModel.fromJson(Map<String, dynamic> json) => ListAgencyModel(
        sts: json["sts"],
        msg: json["msg"],
        agency: List<Agency>.from(json["agency"].map((x) => Agency.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "agency": List<dynamic>.from(agency.map((x) => x.toJson())),
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
        lisenceExpiry: json["lisence_expiry"] == null ? null : DateTime.parse(json["lisence_expiry"]),
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
        "lisence_expiry": lisenceExpiry == null ? null : "${lisenceExpiry.year.toString().padLeft(4, '0')}-${lisenceExpiry.month.toString().padLeft(2, '0')}-${lisenceExpiry.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
    };
}
