
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/home/screen/reciept/receipt.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class ScanScreen extends StatelessWidget {

  var qrstr = "let's Scan it";
  var height,width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
         return Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Tourista')),
              backgroundColor: kPrimaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),

                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),),
                              onPressed: ()async{
                             AppCubit.get(context).scanQr();
                              await Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => ReceiptScreen(Cart: AppCubit.get(context).Cart! ),
                               ),);
                          }, child:
                          Text(('Scan to checkout'))),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
        );
      },
    );

  }
  //
}
// safeArea(
// child: Center(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children:
// [ConditionalBuilder(
// condition: state is! getCartLoadingState ,
// builder: (BuildContext) => ReceiptScreen(Cart: AppCubit.get(context).Cart!),
// fallback: (BuildContext) => Center(child: CircularProgressIndicator()),
// ),]
// ),
// ),
// );