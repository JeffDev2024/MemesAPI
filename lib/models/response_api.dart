/// memes : [{"id":863758,"description":"Yes it is.","url":"https://i.imgur.com/6xClnzy.jpg","type":"image/jpeg"},{"id":863802,"description":"Spec Ghost","url":"https://i.imgur.com/dhdPLW8.jpg","type":"image/jpeg"},{"id":863808,"description":"Heyyy Older Millennials!: These things defined summer. And there was always that one spoiled kid that had the anti-aircraft missile of super soakers that would destroy the rest of us…","url":"https://i.imgur.com/h2Noi7K.jpg","type":"image/jpeg"},{"id":863810,"description":"Heyyy Older Millennials!: These things had me convinced I’d become a fashion designer. Narrator: She did not.","url":"https://i.imgur.com/qsYbc2T.jpg","type":"image/jpeg"},{"id":863812,"description":"Heyyy Older Millennials!: Windows Start menus hit their prime here.","url":"https://i.imgur.com/W1umuln.jpg","type":"image/jpeg"},{"id":863840,"description":"Who","url":"https://i.imgur.com/iZfn3iq.jpg","type":"image/jpeg"},{"id":863874,"description":"Old Orc very lucky indeed","url":"https://i.imgur.com/aOQQOeP.png","type":"image/png"},{"id":864042,"description":"T-Rex forever","url":"https://i.imgur.com/m2RFaWG.jpg","type":"image/jpeg"},{"id":864054,"description":"Ever again","url":"https://i.imgur.com/SPyzgBQ.jpg","type":"image/jpeg"},{"id":864162,"description":"Quaque!?","url":"https://i.imgur.com/F4cPN8e.jpg","type":"image/jpeg"}]
/// available : 247089

class ResponseApi {
  ResponseApi({
      List<Memes>? memes, 
      num? available,}){
    _memes = memes;
    _available = available;
}

  ResponseApi.fromJson(dynamic json) {
    if (json['memes'] != null) {
      _memes = [];
      json['memes'].forEach((v) {
        _memes?.add(Memes.fromJson(v));
      });
    }
    _available = json['available'];
  }
  List<Memes>? _memes;
  num? _available;
ResponseApi copyWith({  List<Memes>? memes,
  num? available,
}) => ResponseApi(  memes: memes ?? _memes,
  available: available ?? _available,
);
  List<Memes>? get memes => _memes;
  num? get available => _available;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_memes != null) {
      map['memes'] = _memes?.map((v) => v.toJson()).toList();
    }
    map['available'] = _available;
    return map;
  }

}

/// id : 863758
/// description : "Yes it is."
/// url : "https://i.imgur.com/6xClnzy.jpg"
/// type : "image/jpeg"

class Memes {
  Memes({
      num? id, 
      String? description, 
      String? url, 
      String? type,}){
    _id = id;
    _description = description;
    _url = url;
    _type = type;
}

  Memes.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _url = json['url'];
    _type = json['type'];
  }
  num? _id;
  String? _description;
  String? _url;
  String? _type;
Memes copyWith({  num? id,
  String? description,
  String? url,
  String? type,
}) => Memes(  id: id ?? _id,
  description: description ?? _description,
  url: url ?? _url,
  type: type ?? _type,
);
  num? get id => _id;
  String? get description => _description;
  String? get url => _url;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['url'] = _url;
    map['type'] = _type;
    return map;
  }

}