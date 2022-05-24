class drivers {

  String? imageurl, name, DriverId, driverEmail;


  drivers({
    this.imageurl,
    this.name,
    this.DriverId,
    this.driverEmail,

  });

  drivers.fromJson(Map<String, dynamic> json) {
    imageurl = json['imageurl'];
    name = json['name'];
    DriverId = json['DriverId'];
    driverEmail =json['driverEmail'];
  }

  Map<String, dynamic> toMap() {
    return {
      'imageurl': imageurl,
      'name': name,
      'DriverId': DriverId,
      'driverEmail' : driverEmail,
    };
  }
}