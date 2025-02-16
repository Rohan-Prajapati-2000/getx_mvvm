class UrlShortnerModel {
  String? id;
  String? shortId;
  String? redirectUrl;
  List<VisitHistoryModel>? visitHistory;
  String? createdAt;
  String? updatedAt;

  UrlShortnerModel({this.id, this.shortId, this.redirectUrl, this.visitHistory, this.createdAt, this.updatedAt});

  UrlShortnerModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    shortId = json['shortUrl'];
    redirectUrl = json['redirectUrl'];
    if(json['visitHistory'] != null ){
      visitHistory = <VisitHistoryModel>[];
      json['visitHistory'].forEach((value){
        visitHistory!.add(VisitHistoryModel.fromJson(value));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['shortId'] = this.shortId;
    data['redirectUrl'] = this.redirectUrl;
    if(this.visitHistory != null){
      data['visitHistory'] = this.visitHistory!.map((value)=> value.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class VisitHistoryModel{
  var timestamp;

  VisitHistoryModel({this.timestamp});

  VisitHistoryModel.fromJson(Map<String, dynamic> json){
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['timestamp'] = this.timestamp;
    return data;
  }
}