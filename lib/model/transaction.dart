import 'package:ecoplants/model/product.dart';

class Transaction {
  Transaction({
    required this.iD,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    required this.quantity,
    required this.totalProduct,
    required this.status,
    required this.address,
    required this.paymentMethod,
    required this.paymentPrice,
    required this.shippingMethod,
    required this.estimate,
    required this.total,
  });
  late int iD;
  late String createdAt;
  late String updatedAt;
  late Product product;
  late int quantity;
  late int totalProduct;
  late String status;
  late String address;
  late String paymentMethod;
  late int paymentPrice;
  late String shippingMethod;
  late String estimate;
  late int total;

  Transaction.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
    totalProduct = json['total_product'];
    status = json['status'];
    address = json['address'];
    paymentMethod = json['payment_method'];
    paymentPrice = json['payment_price'];
    shippingMethod = json['shipping_method'];
    estimate = json['estimate'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = iD;
    _data['CreatedAt'] = createdAt;
    _data['UpdatedAt'] = updatedAt;
    _data['product'] = product.toJson();
    _data['quantity'] = quantity;
    _data['total_product'] = totalProduct;
    _data['status'] = status;
    _data['address'] = address;
    _data['payment_method'] = paymentMethod;
    _data['payment_price'] = paymentPrice;
    _data['shipping_method'] = shippingMethod;
    _data['estimate'] = estimate;
    _data['total'] = total;
    return _data;
  }
}
