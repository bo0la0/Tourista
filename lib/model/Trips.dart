
class Trips {

  String? TourGuidId,driverId,tripId,description, tripCity, tripLocation,tripImg,shortdesc;
  int? price, availableSeats;
  Map<String,dynamic>? tourists;
  DateTime? date;
  // DateTime.parse(timestamp.toDate().toString())
  Trips({
    this.TourGuidId,
    this.driverId,
    this.tripId,
    this.description,
    this.tourists,
    this.tripCity,
    this.tripLocation,
    this.price,
    this.availableSeats,
    this.tripImg,
    this.shortdesc,
    this.date,
  });

  factory Trips.fromJson(Map<String, dynamic> json) {
    return Trips(
    TourGuidId : json['TourGuidId'],
    driverId : json['driverId'],
    tripId : json['tripId'],
    description : json['description'],
      tourists : json['tourists'],
    tripCity : json['tripCity'],
    tripLocation : json['tripLocation'],
    price : json['price'],
    availableSeats : json['availableSeats'],
    tripImg : json['tripImg'],
    shortdesc : json['shortdesc'],
    //date : DateTime.parse(timestamp.toDate().toString()),
    );

  }

  Map<String, dynamic> toMap() {
    return {
    'TourGuidId' : TourGuidId,
    'driverId' : driverId,
    'tripId' : tripId,
    'description' : description,
    'tourists' : tourists,
    'tripCity' : tripCity,
    'tripLocation' : tripLocation,
    'price' : price,
    'availableSeats' : availableSeats,
    'tripImg' : tripImg,
    'shortdesc' : shortdesc,
    'date' : date,
    };
  }
}
