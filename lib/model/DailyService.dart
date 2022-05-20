class dailyService {

  String? image, title,location,id;

  dailyService({
    this.title,
    this.image,
    this.location,
    this.id,
  });

  dailyService.fromJson(Map<String, dynamic> json) {
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
