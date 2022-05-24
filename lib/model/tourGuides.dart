class tourGuides{

  String? imageurl, name, tourguidId, location, tourGuidEmail;


  tourGuides({
    this.imageurl,
    this.name,
    this.tourguidId,
    this.location,
    this.tourGuidEmail,
  });

  tourGuides.fromJson(Map<String, dynamic> json) {
    imageurl = json['imageurl'];
    name = json['name'];
    tourguidId = json['DriverId'];
    location = json['location'];
    tourGuidEmail = json ['tourGuidEmail'];
  }

  Map<String, dynamic> toMap() {
    return {
      'imageurl': imageurl,
      'name': name,
      'tourguidId': tourguidId,
      'location': location,
      'tourGuidEmail' : tourGuidEmail,
    };
  }
}