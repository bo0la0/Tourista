import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tourista/model/style/TextStyle.dart';

class Scan_qr extends StatefulWidget {
  @override
  _Scan_qrState createState() => _Scan_qrState();
}

class _Scan_qrState extends State<Scan_qr> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
//barcode scanner flutter ant
  final controllre=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                leading:IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: (){Navigator.pop(context);} ,),
                toolbarHeight: 100,

                backgroundColor:Color(-1088543194),
                title: Text("Tourista",style: TextStyle(fontSize: 20),),
                elevation: 0.8,
                actions: [
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.notifications),
                      iconSize: 30,
                      alignment: Alignment.centerLeft,
                      onPressed: () {
                      },),),]),
            body: Builder(builder: (BuildContext context) {
              return ListView(
                padding: EdgeInsetsDirectional.all(40),
                  children:[
                    Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,1),blurRadius: 32,color: Colors.black12),], color: Colors.white),
                          child: MaterialButton(
                            onPressed: () => scanBarcodeNormal(),
                           /** child: QrImage(
                              data: controllre.text,
                              version: QrVersions.auto,
                              backgroundColor: Colors.white,
                              size: 300.0,
                            ),**/
                        ),
                        ),
                        SizedBox(height: 20,),

                        Text("SCAN TO CHECKOUT",style: s1),
                        SizedBox(height: 20,),

                        Text('Scan result : $_scanBarcode\n',
                            style: s1)
                      ],),],);
            })));
  }
}
