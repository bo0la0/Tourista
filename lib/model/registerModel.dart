class UserModel
{
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  int? balance;
  String? language;


  UserModel({
    this.email,
    this.phone,
    this.name,
    this.uId,
    this.image,
    this.balance,
    this.language,
});

  UserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    balance = json['balance'];
    language = json['language'];
  }
  Map<String, dynamic> toMap()
  {
    return{
      'email':email,
      'name':name,
      'phone':phone,
      'uId':uId,
      'image':image,
      'balance':balance,
      'language':language,

    };
  }
}