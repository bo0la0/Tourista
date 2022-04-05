import 'package:flutter/material.dart';
class user_accont extends StatelessWidget {
  const user_accont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){Navigator.pop(context);} ,),
          backgroundColor: Color(-1088543194),toolbarHeight: 100,
    title: Text("my account"),

    ),);

  }
}
