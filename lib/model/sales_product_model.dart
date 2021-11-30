class SalesModel {
  int? id;
  late double value;
  late String salesProduct;

  SalesModel({this.id, required this.value, required this.salesProduct});

  SalesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    salesProduct = json['salesProduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['salesProduct'] = this.salesProduct;
    return data;
  }
}
