
class CatFacts {
  CatFacts({
      Status? status, 
      String? id, 
      String? user, 
      String? text, 
      int? v, 
      String? source, 
      String? updatedAt, 
      String? type, 
      String? createdAt, 
      bool? deleted, 
      bool? used,}){
    _status = status;
    _id = id;
    _user = user;
    _text = text;
    _v = v;
    _source = source;
    _updatedAt = updatedAt;
    _type = type;
    _createdAt = createdAt;
    _deleted = deleted;
    _used = used;
}

  CatFacts.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _id = json['_id'];
    _user = json['user'];
    _text = json['text'];
    _v = json['__v'];
    _source = json['source'];
    _updatedAt = json['updatedAt'];
    _type = json['type'];
    _createdAt = json['createdAt'];
    _deleted = json['deleted'];
    _used = json['used'];
  }
  Status? _status;
  String? _id;
  String? _user;
  String? _text;
  int? _v;
  String? _source;
  String? _updatedAt;
  String? _type;
  String? _createdAt;
  bool? _deleted;
  bool? _used;
CatFacts copyWith({  Status? status,
  String? id,
  String? user,
  String? text,
  int? v,
  String? source,
  String? updatedAt,
  String? type,
  String? createdAt,
  bool? deleted,
  bool? used,
}) => CatFacts(  status: status ?? _status,
  id: id ?? _id,
  user: user ?? _user,
  text: text ?? _text,
  v: v ?? _v,
  source: source ?? _source,
  updatedAt: updatedAt ?? _updatedAt,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  deleted: deleted ?? _deleted,
  used: used ?? _used,
);
  Status? get status => _status;
  String? get id => _id;
  String? get user => _user;
  String? get text => _text;
  int? get v => _v;
  String? get source => _source;
  String? get updatedAt => _updatedAt;
  String? get type => _type;
  String? get createdAt => _createdAt;
  bool? get deleted => _deleted;
  bool? get used => _used;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    map['_id'] = _id;
    map['user'] = _user;
    map['text'] = _text;
    map['__v'] = _v;
    map['source'] = _source;
    map['updatedAt'] = _updatedAt;
    map['type'] = _type;
    map['createdAt'] = _createdAt;
    map['deleted'] = _deleted;
    map['used'] = _used;
    return map;
  }

}

class Status {
  Status({
      bool? verified, 
      String? feedback, 
      int? sentCount,}){
    _verified = verified;
    _feedback = feedback;
    _sentCount = sentCount;
}

  Status.fromJson(dynamic json) {
    _verified = json['verified'];
    _feedback = json['feedback'];
    _sentCount = json['sentCount'];
  }
  bool? _verified;
  String? _feedback;
  int? _sentCount;
Status copyWith({  bool? verified,
  String? feedback,
  int? sentCount,
}) => Status(  verified: verified ?? _verified,
  feedback: feedback ?? _feedback,
  sentCount: sentCount ?? _sentCount,
);
  bool? get verified => _verified;
  String? get feedback => _feedback;
  int? get sentCount => _sentCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['verified'] = _verified;
    map['feedback'] = _feedback;
    map['sentCount'] = _sentCount;
    return map;
  }

}