import 'package:flutter/material.dart';

class ROW2 extends StatelessWidget {
  const ROW2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey.shade300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: Text(
                "Bazaars",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional.topStart,
              height: 20,
            ),
            SizedBox(
              width: width * 0.35,
            ),
            Container(
              child: Text(
                "(10% off)",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional.topStart,
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
