class DonationTransaction {
  DonationTransaction({
    required this.iD,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.donationId,
    required this.nominal,
    required this.paymentMethod,
    required this.status,
  });
  late int iD;
  late String createdAt;
  late String updatedAt;
  late int userId;
  late int donationId;
  late int nominal;
  late String paymentMethod;
  late String status;

  DonationTransaction.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    userId = json['user_id'];
    donationId = json['donation_id'];
    nominal = json['nominal'];
    paymentMethod = json['payment_method'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = iD;
    _data['CreatedAt'] = createdAt;
    _data['UpdatedAt'] = updatedAt;
    _data['user_id'] = userId;
    _data['donation_id'] = donationId;
    _data['nominal'] = nominal;
    _data['payment_method'] = paymentMethod;
    _data['status'] = status;
    return _data;
  }
}
