import 'package:cloud_firestore/cloud_firestore.dart';

class Trips {
  String? TourGuidId,
      driverId,
      tripId,
      description,
      tripCity,
      tripLocation,
      tripImg,
      shortdesc;
  int? price;
  int availableSeats;
  Timestamp? date;
  // DateTime.parse(timestamp.toDate().toString())
  Trips({
    this.TourGuidId,
    this.driverId,
    this.tripId,
    this.description,
    this.tripCity,
    this.tripLocation,
    this.price,
    required this.availableSeats,
    this.tripImg,
    this.shortdesc,
    this.date,
  });

  factory Trips.fromJson(Map<String, dynamic> json) {
    return Trips(
      TourGuidId: json['TourGuidId'],
      driverId: json['driverId'],
      tripId: json['tripId'],
      description: json['description'],
      tripCity: json['tripCity'],
      tripLocation: json['tripLocation'],
      price: json['price'],
      availableSeats: json['availableSeats'],
      tripImg: json['tripImg'],
      shortdesc: json['shortdesc'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TourGuidId': TourGuidId,
      'driverId': driverId,
      'tripId': tripId,
      'description': description,
      'tripCity': tripCity,
      'tripLocation': tripLocation,
      'price': price,
      'availableSeats': availableSeats,
      'tripImg': tripImg,
      'shortdesc': shortdesc,
      'date': date,
    };
  }
}
