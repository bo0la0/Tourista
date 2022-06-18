abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates
{
  final String error;

  AppGetUserErrorState(this.error);
}

// class scanqrState extends AppStates {}
class AppChangeBottomNavState extends AppStates {}
class AppImagePickedSuccessState extends AppStates {}
class AppImagePickedErorrState extends AppStates {}
class ImageUploadSuccessState extends AppStates {}
class ImageUploadErrorState extends AppStates {}
class ImageUpdateErrorState extends AppStates {}
class ImageUpdateLoadingState extends AppStates {}
class AddBalanceState extends AppStates {}

class AppGetdataLoadingState extends AppStates {}

class AppGetdataSuccessState extends AppStates {}

class AppGetdataErrorState extends AppStates
{
  final String error;

  AppGetdataErrorState(this.error);
}


class AppGetTripsLoadingState extends AppStates {}

class AppGetTripsSuccessState extends AppStates {}

class AppGetTripsErrorState extends AppStates
{
  final String error;

  AppGetTripsErrorState(this.error);
}
class ChangeIconState extends AppStates {}
class ChangeIconState2 extends AppStates {}

class BookingTripLoadingState extends AppStates {}
class BookingTripSuccessState extends AppStates {}
class BookingTripErrorState extends AppStates {}

class updateSeatState extends AppStates {}
class updatebookedlist extends AppStates {}
class updatebookedlistscusses extends AppStates {}

class cancelTripLoadingState extends AppStates {}
class cancelTripSuccessState extends AppStates {}
class cancelTripErrorState extends AppStates {}
class cancelTripSeatSuccessState   extends AppStates {}

class GetMessagesSuccess extends AppStates {}

class SendMessage extends AppStates {
  final String message;

  SendMessage({
    required this.message,
  });
}

class CreateChatError extends AppStates {
  final String message;

  CreateChatError({
    required this.message,
  });
}
class getReportLoadingstate extends AppStates{}
class getReportSuccessstate extends AppStates{}
class getFeedBackSuccessstate extends AppStates{}
class getFeedBackLoadingstate extends AppStates{}
class getCartLoadingState extends AppStates{}

class getCartSuccessState extends AppStates{}
class scanQrSuccessState extends AppStates{}
class scanQrErrorState extends AppStates{}
class scanQrLoadingState extends AppStates{}
class totalCartState extends AppStates{}

class OrderLoadingState extends AppStates {}
class OrderSuccessState extends AppStates {}
class OrderErrorState extends AppStates {}

class cancelOrderLoadingState extends AppStates {}
class cancelOrderSuccessState extends AppStates {}
class cancelOrderErrorState extends AppStates {}
class TransState extends AppStates {}






