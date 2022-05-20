
class bazarModel {

  String? image, title,id,location;


  bazarModel({
    this.title,
    this.image,
    this.id,
    this.location,

  });

  bazarModel.fromJson(Map<String, dynamic> json) {
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