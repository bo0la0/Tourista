
class TransactionModel {

  String? TouristUid,transactionId,details,trip;
  DateTime? Time;
  int? price, balance;


  TransactionModel({
    this.Time,
    this.TouristUid,
    this.transactionId,
    this.details,
    this.price,
    this.balance,
    this.trip,

  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    Time = json['Time'];
    TouristUid = json['TouristUid'];
    transactionId = json['transactionId'];
    details = json['details'];
    price = json['price'];
    balance = json['balance'];
    trip = json['trip'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Time': Time,
      'TouristUid': TouristUid,
      'transactionId': transactionId,
      'details': details,
      'price': price,
      'balance': balance,
      'trip': trip,
    };
  }
}