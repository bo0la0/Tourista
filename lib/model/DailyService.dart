class Model {

  String? name,email,id;
  int? balance;

  Model({
    this.name,
    this.balance,
    this.email,
    this.id,
  });

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    balance = json['balance'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'balance': balance,
      'email': email,
      'id': id,
    };
  }
}
