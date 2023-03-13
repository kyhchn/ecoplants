import 'product.dart';

class Transaction {
  int iD;
  String createdAt;
  String updatedAt;
  Product product;
  int quantity;
  int total;
  int userId;
  int productId;

  Transaction(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      required this.product,
      required this.quantity,
      required this.total,
      required this.userId,
      required this.productId});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        iD: json['ID'],
        createdAt: json['CreatedAt'],
        updatedAt: json['UpdatedAt'],
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
        total: json['total'],
        userId: json['user_id'],
        productId: json['product_id']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    data['product'] = product;
    data['quantity'] = quantity;
    data['total'] = total;
    data['user_id'] = userId;
    data['product_id'] = productId;
    return data;
  }
}
