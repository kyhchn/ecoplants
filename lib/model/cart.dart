import 'package:ecoplants/model/product.dart';

class Cart {
  Cart({
    required this.product,
    required this.quantity,
    required this.total,
  });
  Product product;
  int quantity;
  int total;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
        total: json['total']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product'] = product.toJson();
    _data['quantity'] = quantity;
    _data['total'] = total;
    return _data;
  }
}
