class hotelModel {
  double? rating;
  int? id,reviews;
  String? title, pricePerNight, image, location,city;

  hotelModel({
    this.id,
    this.pricePerNight,
    this.title,
    this.image,
    this.location,
    this.reviews,
    this.city,
    this.rating,
  });

  hotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pricePerNight = json['price'];
    title = json['title'];
    image = json['image'];
    location = json['location'];
    reviews = json['reviews'];
    city = json['city'];
    rating = json['rating'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': pricePerNight,
      'title': title,
      'image': image,
      'location': location,
      'reviews': reviews,
      'rating': rating,
    };
  }

}
