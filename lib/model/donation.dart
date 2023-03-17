class Donation {
  Donation({
    required this.iD,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.regency,
    required this.district,
    required this.numDonate,
    required this.wallet,
    required this.target,
    required this.remainDay,
    required this.plan,
    required this.news,
    required this.picture,
  });
  late int iD;
  late String createdAt;
  late String updatedAt;
  late String name;
  late String regency;
  late String district;
  late int numDonate;
  late int wallet;
  late int target;
  late int remainDay;
  late String plan;
  late String news;
  late String picture;

  Donation.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    name = json['name'];
    regency = json['regency'];
    district = json['district'];
    numDonate = json['num_donate'];
    wallet = json['wallet'];
    target = json['target'];
    remainDay = json['remain_day'];
    plan = json['plan'];
    news = json['news'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = iD;
    _data['CreatedAt'] = createdAt;
    _data['UpdatedAt'] = updatedAt;
    _data['name'] = name;
    _data['regency'] = regency;
    _data['district'] = district;
    _data['num_donate'] = numDonate;
    _data['wallet'] = wallet;
    _data['target'] = target;
    _data['remain_day'] = remainDay;
    _data['plan'] = plan;
    _data['news'] = news;
    _data['picture'] = picture;
    return _data;
  }
}
