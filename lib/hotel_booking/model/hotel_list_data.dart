class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'https://exp.cdn-hotels.com/hotels/45000000/44090000/44087000/44086918/16f1da52_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    HotelListData(
      imagePath: 'https://exp.cdn-hotels.com/hotels/45000000/44090000/44087000/44086918/6ea41622_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    HotelListData(
      imagePath: 'https://exp.cdn-hotels.com/hotels/45000000/44090000/44087000/44086918/16f1da52_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HotelListData(
      imagePath: 'https://exp.cdn-hotels.com/hotels/45000000/44090000/44087000/44086918/6ea41622_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelListData(
      imagePath: 'https://exp.cdn-hotels.com/hotels/45000000/44090000/44087000/44086918/16f1da52_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
