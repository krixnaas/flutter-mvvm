class MovieListModel {
  int? code;
  String? reason;
  List<Response>? response;

  MovieListModel({this.code, this.reason, this.response});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reason = json['reason'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['reason'] = this.reason;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? id;
  String? vendorkaId;
  String? name;
  String? slug;
  String? position;
  String? contentCount;
  String? updatedAt;
  Null? description;
  List<Images>? images;

  Response(
      {this.id,
        this.vendorkaId,
        this.name,
        this.slug,
        this.position,
        this.contentCount,
        this.updatedAt,
        this.description,
        this.images});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorkaId = json['vendorka_id'];
    name = json['name'];
    slug = json['slug'];
    position = json['position'];
    contentCount = json['content_count'];
    updatedAt = json['updated_at'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendorka_id'] = this.vendorkaId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['position'] = this.position;
    data['content_count'] = this.contentCount;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? url;
  int? width;
  int? height;
  String? type;

  Images({this.url, this.width, this.height, this.type});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['type'] = this.type;
    return data;
  }
}