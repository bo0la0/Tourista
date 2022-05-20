class hotelModel {
  int? id;
  String? title, price, image, address;

  hotelModel({
    this.id,
    this.price,
    this.title,
    this.image,
    this.address,
  });

  hotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    title = json['title'];
    image = json['image'];
    address = json['address'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'title': title,
      'image': image,
      'address': address,
    };
  }
}
