class Trips {

  String? TourGuidId,driverId,tripId,description, uId, tripPlace, tripLocation,tripImg;
  int? price, availableSeats;

  Trips({
    this.TourGuidId,
    this.driverId,
    this.tripId,
    this.description,
    this.uId,
    this.tripPlace,
    this.tripLocation,
    this.price,
    this.availableSeats,
    this.tripImg,
  });

  Trips.fromJson(Map<String, dynamic> json) {
    TourGuidId = json['TourGuidId'];
    driverId = json['driverId'];
    tripId = json['tripId'];
    description = json['description'];
    uId = json['uId'];
    tripPlace = json['tripPlace'];
    tripLocation = json['triplocation'];
    price = json['price'];
    availableSeats = json['availableSeats'];
    tripImg = json['tripImg'];

  }

  Map<String, dynamic> toMap() {
    return {
    'TourGuidId' : TourGuidId,
    'driverId' : driverId,
    'tripId' : tripId,
    'description' : description,
    'uId' : uId,
    'tripPlace' : tripPlace,
    'tripLocation' : tripLocation,
    'price' : price,
    'availableSeats' : availableSeats,
      'tripImg' : tripImg,
    };
  }
}
