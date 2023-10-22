class BannerListModel {
  bool? success;
  List<Data>? data;
  String? message;
  int? status;
  String? timestamp;

  BannerListModel(
      {this.success, this.data, this.message, this.status, this.timestamp});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? url;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  int? type;
  int? status;
  Null? clientId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.description,
        this.url,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.type,
        this.status,
        this.clientId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    type = json['type'];
    status = json['status'];
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['start_date'] = this.startDate;
    data['start_time'] = this.startTime;
    data['end_date'] = this.endDate;
    data['end_time'] = this.endTime;
    data['type'] = this.type;
    data['status'] = this.status;
    data['client_id'] = this.clientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}