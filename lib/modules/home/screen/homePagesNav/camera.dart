import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
/*class camera extends StatelessWidget {
  const camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){Navigator.pop(context);} ,),
        backgroundColor: Color(-1088543194),toolbarHeight: 100,
        title: Text("camera"),

      ),

    );
  }
}*/
class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  File? image;

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(-1088543194),toolbarHeight: 100,
          title: Text("camera"),
         // title: const Text("Image Picker Example"),
        ),
        body: Center(
             child: Column(
                children: [
                  MaterialButton(
                      color: Color(-1088543194),
                      child: const Text(
                          "Pick Image from Camera",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold
                          )
                      ),
                      onPressed: () {
                        pickImageC();
                      }
                  ),
                  SizedBox(height: 20,),
                  image != null ? Image.file(image!): Text("No image selected")
                ],
             ),

    ),
    );
  }
}

