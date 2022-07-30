/// id : "595f280c557291a9750ebf80"
/// created_at : "2015-11-06T18:36:37.342Z"
/// tags : ["cute","eyes"]

class CatFacts {
  CatFacts({
      String? id, 
      String? createdAt, 
      List<String>? tags,}){
    _id = id;
    _createdAt = createdAt;
    _tags = tags;
}

  CatFacts.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  String? _id;
  String? _createdAt;
  List<String>? _tags;
CatFacts copyWith({  String? id,
  String? createdAt,
  List<String>? tags,
}) => CatFacts(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  tags: tags ?? _tags,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  List<String>? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['tags'] = _tags;
    return map;
  }

}