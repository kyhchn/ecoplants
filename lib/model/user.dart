import 'package:ecoplants/model/transaction.dart';

import 'cart.dart';

class User {
  User({
    required this.iD,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.transaction,
    required this.shippingAddressId,
  });
  late int iD;
  late String createdAt;
  late String updatedAt;
  late String name;
  late String username;
  late String email;
  late Address address;
  late String phone;
  late List<Transaction> transaction;
  late int shippingAddressId;
  late List<Cart> carts;

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = Address.fromJson(json['address']);
    phone = json['phone'] ?? '';
    transaction = List<Transaction>.from(
        (json['transaction'] as List).map((e) => Transaction.fromJson(e)));
    shippingAddressId = json['shipping_address_id'] ?? 0;
    carts = List<Cart>.from(
        (json['cart']['items'] as List).map((e) => Cart.fromJson(e)));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = iD;
    _data['CreatedAt'] = createdAt;
    _data['UpdatedAt'] = updatedAt;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['address'] = address.toJson();
    _data['phone'] = phone;
    _data['transaction'] = transaction;
    _data['shipping_address_id'] = shippingAddressId;
    return _data;
  }
}

class Address {
  Address({
    required this.id,
    required this.recipient,
    required this.phone,
    required this.province,
    required this.regencyDistrict,
    required this.home,
    required this.postalCode,
  });
  late int id;
  late String recipient;
  late String phone;
  late String province;
  late String regencyDistrict;
  late String home;
  late int postalCode;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    recipient = json['recipient'];
    phone = json['phone'];
    province = json['province'];
    regencyDistrict = json['regency_district'];
    home = json['home'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['recipient'] = recipient;
    _data['phone'] = phone;
    _data['province'] = province;
    _data['regency_district'] = regencyDistrict;
    _data['home'] = home;
    _data['postal_code'] = postalCode;
    return _data;
  }
}
