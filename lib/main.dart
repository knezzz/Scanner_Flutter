import 'package:flutter/material.dart';
import 'package:scanner_poc/qr_code_scanner_poc/qr_code_scanner_screen.dart';
import 'package:scanner_poc/qr_mobile_vision_poc/qr_mobile_vision_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner POC'),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text('QR Code Scanner'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(builder: (_) => QRCodeScannerScreen()));
              },
            ),
            ListTile(
              title: Text('QR Mobile Vision'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(builder: (_) => QRMobileVisionScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
