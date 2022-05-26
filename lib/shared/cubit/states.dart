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
class updateState extends AppStates {}
class updatebookedlist extends AppStates {}
class updatebookedlistscusses extends AppStates {}



