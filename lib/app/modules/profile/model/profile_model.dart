class ProfileModel {
  String? status;
  List<Data>? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? photo;
  String? mobile;
  String? email;
  String? emailVerifiedAt;
  String? refererCode;
  int? isAdmin;
  int? activeStatus;
  String? createdAt;
  String? updatedAt;
  int? divisionId;
  int? districtId;
  int? upazilaId;
  int? dialectId;
  int? createdBy;
  int? updatedBy;
  int? totalPoints;

  Data(
      {this.id,
        this.name,
        this.photo,
        this.mobile,
        this.email,
        this.emailVerifiedAt,
        this.refererCode,
        this.isAdmin,
        this.activeStatus,
        this.createdAt,
        this.updatedAt,
        this.divisionId,
        this.districtId,
        this.upazilaId,
        this.dialectId,
        this.createdBy,
        this.updatedBy,
        this.totalPoints});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    refererCode = json['referer_code'];
    isAdmin = json['is_admin'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    upazilaId = json['upazila_id'];
    dialectId = json['dialect_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    totalPoints = json['total_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['referer_code'] = this.refererCode;
    data['is_admin'] = this.isAdmin;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['upazila_id'] = this.upazilaId;
    data['dialect_id'] = this.dialectId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['total_points'] = this.totalPoints;
    return data;
  }
}
