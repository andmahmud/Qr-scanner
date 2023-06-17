import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "QR Code Scanner",
     debugShowCheckedModeBanner: false,
     home: QRCodeWidget(),
    
    );
  }
}  

class QRCodeWidget extends StatefulWidget {
  const QRCodeWidget({super.key});

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {

  final GlobalKey qrky = GlobalKey(debugLabel: "QR");

  QRViewController? controller;
  String result = "";
  @override 
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
  void onQRViewCreated(QRViewController controller){
    this.controller=controller;
    controller.scannedDataStream.listen((scanData){
      setState(() {
        result=scanData.code!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
