class AllRecordModel {
  String? status;
  Data? data;

  AllRecordModel({this.status, this.data});

  AllRecordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<DataList>? dataList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.dataList,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataList = <DataList>[];
      json['data'].forEach((v) {
        dataList!.add(new DataList.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.dataList != null) {
      data['dataList'] = this.dataList!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataList {
  int? id;
  Null? text;
  String? userSentence;
  String? records;
  int? totalSeconds;
  String? status;
  int? userId;
  int? campaignId;
  int? topicSessionId;
  int? questionnaireId;
  int? divisionId;
  int? districtId;
  int? upazilaId;
  int? dialectId;
  String? createdAt;
  String? updatedAt;
  Questionnaire? questionnaire;
  User? user;
  Campaign? campaign;

  DataList(
      {this.id,
        this.text,
        this.userSentence,
        this.records,
        this.totalSeconds,
        this.status,
        this.userId,
        this.campaignId,
        this.topicSessionId,
        this.questionnaireId,
        this.divisionId,
        this.districtId,
        this.upazilaId,
        this.dialectId,
        this.createdAt,
        this.updatedAt,
        this.questionnaire,
        this.user,
        this.campaign});

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    userSentence = json['user_sentence'];
    records = json['records'];
    totalSeconds = json['total_seconds'];
    status = json['status'];
    userId = json['user_id'];
    campaignId = json['campaign_id'];
    topicSessionId = json['topic_session_id'];
    questionnaireId = json['questionnaire_id'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    upazilaId = json['upazila_id'];
    dialectId = json['dialect_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    questionnaire = json['questionnaire'] != null
        ? new Questionnaire.fromJson(json['questionnaire'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    campaign = json['campaign'] != null
        ? new Campaign.fromJson(json['campaign'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['user_sentence'] = this.userSentence;
    data['records'] = this.records;
    data['total_seconds'] = this.totalSeconds;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['campaign_id'] = this.campaignId;
    data['topic_session_id'] = this.topicSessionId;
    data['questionnaire_id'] = this.questionnaireId;
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['upazila_id'] = this.upazilaId;
    data['dialect_id'] = this.dialectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.questionnaire != null) {
      data['questionnaire'] = this.questionnaire!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.campaign != null) {
      data['campaign'] = this.campaign!.toJson();
    }
    return data;
  }
}

class Questionnaire {
  int? id;
  String? question;
  Null? questionImage;
  String? questionType;
  int? limitSec;
  int? activeStatus;
  Null? createdAt;
  Null? updatedAt;
  int? topicId;
  Topic? topic;

  Questionnaire(
      {this.id,
        this.question,
        this.questionImage,
        this.questionType,
        this.limitSec,
        this.activeStatus,
        this.createdAt,
        this.updatedAt,
        this.topicId,
        this.topic});

  Questionnaire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    questionImage = json['question_image'];
    questionType = json['question_type'];
    limitSec = json['limit_sec'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    topicId = json['topic_id'];
    topic = json['topic'] != null ? new Topic.fromJson(json['topic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['question_image'] = this.questionImage;
    data['question_type'] = this.questionType;
    data['limit_sec'] = this.limitSec;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['topic_id'] = this.topicId;
    if (this.topic != null) {
      data['topic'] = this.topic!.toJson();
    }
    return data;
  }
}

class Topic {
  int? id;
  String? name;
  String? description;
  int? activeStatus;
  String? createdAt;
  String? updatedAt;

  Topic(
      {this.id,
        this.name,
        this.description,
        this.activeStatus,
        this.createdAt,
        this.updatedAt});

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Campaign {
  int? id;
  String? name;
  String? coverPhoto;
  String? rawDescription;
  Null? longDescription;
  Null? campaignType;
  String? status;
  String? createdAt;
  String? updatedAt;

  Campaign(
      {this.id,
        this.name,
        this.coverPhoto,
        this.rawDescription,
        this.longDescription,
        this.campaignType,
        this.status,
        this.createdAt,
        this.updatedAt});

  Campaign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverPhoto = json['cover_photo'];
    rawDescription = json['raw_description'];
    longDescription = json['long_description'];
    campaignType = json['campaign_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cover_photo'] = this.coverPhoto;
    data['raw_description'] = this.rawDescription;
    data['long_description'] = this.longDescription;
    data['campaign_type'] = this.campaignType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
