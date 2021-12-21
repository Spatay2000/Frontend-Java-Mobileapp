class ShopModel {
  int? id;

  late String salesProduct;

  ShopModel({this.id, required this.salesProduct});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    salesProduct = json['salesProduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['salesProduct'] = this.salesProduct;
    return data;
  }
}
