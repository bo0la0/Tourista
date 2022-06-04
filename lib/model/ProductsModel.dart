
class ProductsModel {

  String? image, name,ItemId,providerId;
  int? price;

  ProductsModel({
    this.name,
    this.image,
    this.ItemId,
    this.price,
    this.providerId,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    name = json['title'];
    image = json['image'];
    ItemId = json['ItemId'];
    price = json['price'];
    providerId = json['serviceProviderId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': name,
      'image': image,
      'ItemId': ItemId,
      'price': price,
      'serviceProviderId': providerId,
    };
  }
}