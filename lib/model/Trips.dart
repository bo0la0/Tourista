
class Trips {
  String?
      tripId,
      description,
      tripCity,
      tripLocation,
      tripImg,
      tourGuide,
      shortdesc;
  double price;
  int availableSeats;
  String? endTime;
  String? fromTime;

  Trips({
    this.tripId,
    this.description,
    this.tripCity,
    this.tripLocation,
    required this.price,
    required this.availableSeats,
    this.tripImg,
    this.shortdesc,
    this.fromTime,
    this.endTime,
    this.tourGuide,
  });

  factory Trips.fromJson(Map<String, dynamic> json) {
    return Trips(
      tripId: json['id'],
      description: json['description'],
      tripCity: json['city'],
      tripLocation: json['location'],
      price: json['price'],
      availableSeats: json['availableSeats'],
      tripImg: json['image'],
      shortdesc: json['shortDescription'],
      endTime: json['endTime'],
      fromTime: json['fromTime'],
      tourGuide: json['tourGuideName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': tripId,
      'description': description,
      'city': tripCity,
      'location': tripLocation,
      'price': price,
      'availableSeats': availableSeats,
      'image': tripImg,
      'shortDescription': shortdesc,
      'endTime': endTime,
      'fromTime': fromTime,
      'tourGuideName': tourGuide,
    };
  }
}




