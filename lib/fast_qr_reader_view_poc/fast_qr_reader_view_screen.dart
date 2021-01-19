// import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter/material.dart';

class FastQrReaderViewScreen extends StatefulWidget {
  @override
  _FastQrReaderViewScreenState createState() => new _FastQrReaderViewScreenState();
}

class _FastQrReaderViewScreenState extends State<FastQrReaderViewScreen> {
  // QRReaderController controller;

  Future<bool> _initScanner() async {
    // print('Getting available cameras');
    // final cameras = await availableCameras();
    // print('Available cameras: ${cameras}');
    // controller = new QRReaderController(cameras[0], ResolutionPreset.medium, [CodeFormat.qr], (dynamic value) {
    //   print(value); // the result!
    //   // ... do something
    //   // wait 3 seconds then start scanning again.
    //   new Future.delayed(const Duration(seconds: 3), controller.startScanning);
    // });
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    //   controller.startScanning();
    // });
    //
    // return true;

    return true;
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast QR Reader View'),
      ),
      body: FutureBuilder(
        future: _initScanner(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            // return AspectRatio(aspectRatio: controller.value.aspectRatio, child: new QRReaderPreview(controller));
            return Center(
              child: Text('Lib is disabled!'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
