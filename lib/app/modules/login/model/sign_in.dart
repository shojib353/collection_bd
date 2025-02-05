class SignIn {
  String? status;
  String? message;
  String? accessToken;
  Data? data;

  SignIn({this.status, this.message, this.accessToken, this.data});

  SignIn.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['accessToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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

  User(
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
        this.updatedBy});

  User.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
