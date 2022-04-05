class ChatModel {

  late final String name;
  late final String message;
  late final String time;
  late final String avtarUrl;
  late  bool IsActive;

  ChatModel(
      {this.name = '', this.message = '', this.time = '', this.avtarUrl = '',required this.IsActive,});
}

List<ChatModel> dummyData = [
  ChatModel(
      name: "Abo simple",
      message: "Hey flutter You r Awsome",
      time: "1d ago",
      avtarUrl:
      "https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    IsActive: false,
  ),

  ChatModel(
      name: "Mr mousa",
      message: "Hey Test What are You doing?",
      time: "5d ago",
      avtarUrl: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    IsActive: false,
  ),
  ChatModel(
      name: "mona",
      message: "I am fine",
      time: "yesterday",
      avtarUrl: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    IsActive: false,
  ),
  ChatModel(
      name: "sabah",
      message: "Hey flutter You r Awsome",
      time: "5m ago",
      avtarUrl: "https://png.pngtree.com/png-vector/20190629/ourlarge/pngtree-business-people-avatar-icon-user-profile-free-vector-png-image_1527664.jpg",
    IsActive: true,
  ),

  ChatModel(
      name: "Katrin",
      message: " okay??",
      time: "now",
      avtarUrl: "https://png.pngtree.com/png-vector/20190629/ourlarge/pngtree-business-people-avatar-icon-user-profile-free-vector-png-image_1527664.jpg",
    IsActive: true,
  ),

];