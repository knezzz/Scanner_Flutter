import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class QRMobileVisionScreen extends StatefulWidget {
  @override
  _QRMobileVisionScreenState createState() => new _QRMobileVisionScreenState();
}

class _QRMobileVisionScreenState extends State<QRMobileVisionScreen> {
  String qr;
  MedicineQrCode _medicineQrCode;
  bool camState = true;

  @override
  void reassemble() {
    super.reassemble();

    _medicineQrCode = null;
    qr = null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('QR Mobile Vision'),
      ),
      body: Center(
        child: QrCamera(
          onError: (context, error) => Text(
            error.toString(),
            style: TextStyle(color: Colors.red),
          ),
          qrCodeCallback: (code) {
            setState(() {
              qr = code;
              _medicineQrCode = MedicineQrCode.fromString(code.trim());
            });
          },
          child: AnimatedAlign(
            duration: Duration(milliseconds: 350),
            alignment: Alignment(0.0, _medicineQrCode == null ? 0.8 : 0.0),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              color: Colors.white54,
              child: _medicineQrCode == null
                  ? Text(
                      '$qr',
                      style: Theme.of(context).textTheme.headline6,
                    )
                  : Text(
                      'MEDICINE!\n$_medicineQrCode',
                      style: Theme.of(context).textTheme.headline6,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class MedicineQrCode {
  MedicineQrCode._(this.gtin, this.serialNumber, this.batch, this.expireDate);

  factory MedicineQrCode.fromString(String s) {
    print('Parsing: $s');

    try {
      final first = s.indexOf('21');
      final second = s.indexOf('10', first);
      final third = s.indexOf('17', second);

      if (first == -1 || second == -1) {
        throw 'Wrong code!';
      }

      final _code = MedicineQrCode._(
        s.substring(0, first).trim(),
        s.substring(first, second).trim(),
        s.substring(second, third == -1 ? s.length : third).trim(),
        third == -1 ? null : s.substring(third, s.length).trim(),
      );

      return _code;
    } catch (e) {
      print(e);
      return null;
    }
  }

  final String gtin;
  final String serialNumber;
  final String batch;
  final String expireDate;

  @override
  String toString() {
    return 'GTIN: $gtin\n'
        'S/N: $serialNumber\n'
        'Batch: $batch\n'
        'Expiry: $expireDate';
  }
}
