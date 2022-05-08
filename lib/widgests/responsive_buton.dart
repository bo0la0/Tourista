import 'package:flutter/cupertino.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isrResponsive;
  double? width;
  final String text;
  final GestureTapCancelCallback onPressed;
  ResponsiveButton({Key? key, this.width, this.isrResponsive=false, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      child: Text(
        //mainAxisAlignment: MainAxisAlignment.center,
          text,
      ),
    );
  }
}
