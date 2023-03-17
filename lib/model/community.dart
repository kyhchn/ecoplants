class AutoGenerate {
  AutoGenerate({
    required this.iD,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.picture,
    required this.email,
    required this.description,
    required this.phone,
    required this.numMember,
    required this.activites,
    required this.document,
  });
  late int iD;
  late String createdAt;
  late String updatedAt;
  late String name;
  late String picture;
  late String email;
  late String description;
  late String phone;
  late int numMember;
  late List<dynamic> activites;
  late String document;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    name = json['name'];
    picture = json['picture'];
    email = json['email'];
    description = json['description'];
    phone = json['phone'];
    numMember = json['num_member'];
    activites = List.castFrom<dynamic, dynamic>(json['activites']);
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = iD;
    _data['CreatedAt'] = createdAt;
    _data['UpdatedAt'] = updatedAt;
    _data['name'] = name;
    _data['picture'] = picture;
    _data['email'] = email;
    _data['description'] = description;
    _data['phone'] = phone;
    _data['num_member'] = numMember;
    _data['activites'] = activites;
    _data['document'] = document;
    return _data;
  }
}
