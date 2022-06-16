
class CartModel {

  String? orderId, providerId;
  late List<order> orders;


  CartModel({
    this.orderId,
    required this.orders,
    this.providerId,
  });



  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      orders: order.fromJsonArray(json['orders']),
      orderId: json['orderId'],
      providerId: json['providerId'],

    );
  }


}
  class order {
  String? image,price,productId,title;

  order({
    this.image,
    this.price,
    this.productId,
    this.title,
  });

  factory order.fromJson(Map<String, dynamic> json) {
    return order(
      image: json['image'],
      price: json['price'],
      productId: json['productId'],
      title: json['title'],

    );
  }
  static List<order> fromJsonArray(List<dynamic> jsonArray) {
    List<order> subCategoriesFromJson = [];

    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(order.fromJson(jsonData));
    });

    return subCategoriesFromJson;
  }
  }

