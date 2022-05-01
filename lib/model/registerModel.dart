class UserModel
{
  String? name;
  String? email;
  String? phone;
  String? uId;


  UserModel({
    this.email,
    this.phone,
    this.name,
    this.uId,
});

  UserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
  }
  Map<String, dynamic> toMap()
  {
    return{
      'email':email,
      'name':name,
      'phone':phone,
      'uId':uId,

    };
  }
}