import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/shared/cubit/state.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);
}