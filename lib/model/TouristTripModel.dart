
import 'package:cloud_firestore/cloud_firestore.dart';

class TouristTripModel {

  String? touristuId;
  GeoPoint? location ;
  String? tripId;

  TouristTripModel({
    this.touristuId,
    this.location,
    this.tripId,
  });

  TouristTripModel.fromJson(Map<String, dynamic> json) {
    touristuId = json['touristuId'];
    location = json['location'];
    tripId = json['tripId'];

  }

  Map<String, dynamic> toMap() {
    return {
      'touristuId': touristuId,
      'location': location,
      'tripId': tripId,
    };
  }

}