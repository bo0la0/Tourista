import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/home/screen/Widgets/homeNav.dart';
import 'package:tourista/shared/BlocObserver.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';
import 'package:tourista/shared/network/remote/dio_helper.dart';
import 'modules/splash/Splash_Screen.dart';
import 'shared/components/constants.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  blocObserver: MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');


  if(uId != null)
  {
    widget = homeNav();
  }else
  {
    widget = Splash_Screen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));

// user login in state
  //
  // if (uId != null){
  //   widget = homeNav();
  //
  // }else {
  //   widget = LoginScreen();
  // }
}
class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData()..getData()..getProducts()..getTrips()..getActivity(),
        ),


      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                          backgroundColor: Colors.white,
                          primaryColor: kPrimaryColor,
                          scaffoldBackgroundColor: Colors.white,
                            ),
            home: startWidget,
          );
        },
      ),
    );

  }
}

