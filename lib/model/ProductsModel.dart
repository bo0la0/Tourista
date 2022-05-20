
class ProductsModel {

  String? image, name,ItemId,price,providerId;

  ProductsModel({
    this.name,
    this.image,
    this.ItemId,
    this.price,
    this.providerId,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    ItemId = json['ItemId'];
    price = json['price'];
    providerId = json['providerId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'ItemId': ItemId,
      'price': price,
      'providerId': providerId,
    };
  }
}