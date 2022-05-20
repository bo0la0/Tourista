import 'package:flutter/material.dart';

class ROW4 extends StatelessWidget {
  const ROW4({Key? key}) : super(key: key);

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
                "Daily Services",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional.topStart,
              height: 20,
            ),
            SizedBox(
              width: width * 0.3,
            ),
            Container(
              child: Text(
                "(5% off)",
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

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8.0),
// child: Container(
// child: Text(
// "(grocery- market - pharmacy)",
// style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// ),
// height: 20,
// width: double.infinity,
// ),
// ),