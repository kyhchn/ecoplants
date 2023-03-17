class Product {
  int iD;
  String createdAt;
  String updatedAt;
  String name;
  int price;
  int rating;
  String description;
  String merchant;
  String picture;
  String regency;
  String district;
  Product(
      {required this.iD,
      required this.createdAt,
      required this.regency,
      required this.district,
      required this.updatedAt,
      required this.name,
      required this.price,
      required this.rating,
      required this.description,
      required this.merchant,
      required this.picture});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        iD: json['ID'],
        createdAt: json['CreatedAt'],
        updatedAt: json['UpdatedAt'],
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        description: json['description'],
        merchant: json['merchant'],
        regency: json['Regency'],
        district: json['District'],
        picture: json['picture']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    data['name'] = name;
    data['price'] = price;
    data['rating'] = rating;
    data['description'] = description;
    data['merchant'] = merchant;
    data['picture'] = picture;
    data['Regency'] = regency;
    data['District'] = district;
    return data;
  }
}
