class ChatDataModel {
  ChatDataModel({
    required this.username,
    required this.userImage,
    required this.userId,
    required this.tripId,
    required this.tripName,
  });

  late final String username;
  late final String userImage;
  late final String userId;
  late final String tripId;
  late final String tripName;

  ChatDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    userImage = json['userImage'] ?? '';
    userId = json['userId'] ?? '';
    tripId = json['tripId'] ?? '';
    tripName = json['tripName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userImage': userImage,
      'userId': userId,
      'tripId': tripId,
      'tripName': tripName,
    };
  }
}