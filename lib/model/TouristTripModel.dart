

class TouristTripModel {

  String? touristuId;
  String? location ;
  String? tripId;
  late int seats ;
  bool? attend;
  String? image;
  String? name;
  String? phone;
  String? docId;


  TouristTripModel({
    this.touristuId,
    this.location,
    this.tripId,
    required this.seats,
    this.image,
    this.name,
    this.phone,
    this.attend,
    this.docId,
  });

  TouristTripModel.fromJson(Map<String, dynamic> json) {
    touristuId = json['touristuId'];
    location = json['location'];
    tripId = json['tripId'];
    seats = json['seats'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    attend = json['attend'];
    docId = json['docId'];

  }

  Map<String, dynamic> toMap() {
    return {
      'touristuId': touristuId,
      'location': location,
      'tripId': tripId,
      'seats': seats,
      'image': image,
      'name': name,
      'phone': phone,
      'attend': attend,
      'docId': docId,
    };
  }

}