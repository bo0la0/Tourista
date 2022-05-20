
class ServiceProviderModel {

  String? image, title,id,location;


  ServiceProviderModel({
    this.title,
    this.image,
    this.id,
    this.location,

  });

  ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
    location = json['location'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'id': id,
      'location': location,
    };
  }
}