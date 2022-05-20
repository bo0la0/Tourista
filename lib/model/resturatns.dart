class Resturant {
  String? title, image, location, id;

  Resturant({
    this.location,
    this.id,
    this.title,
    this.image,
  });


  Resturant.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    image = json['image'];
    location = json['location'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'location': location,
      'id': id,
    };
  }
}
