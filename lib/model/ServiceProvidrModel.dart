
class ServiceProviderModel {

  String? image, title,id,location;
  String? balance;

  ServiceProviderModel({
    this.title,
    this.image,
    this.id,
    this.location,
    this.balance,

  });

  ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    title = json['name'];
    image = json['image'];
    id = json['id'];
    location = json['location'];
    balance = json['balance'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'id': id,
      'location': location,
      'balance': balance.toString(),
    };
  }
}