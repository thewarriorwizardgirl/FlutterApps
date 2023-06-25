import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UpiQrCodeGeneratorOnePage extends StatefulWidget {
  const UpiQrCodeGeneratorOnePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpiQrCodeGeneratorOneState createState() => _UpiQrCodeGeneratorOneState();
}

class _UpiQrCodeGeneratorOneState extends State<UpiQrCodeGeneratorOnePage> {
  String upiId = '5510015222245@yesbankltd';
  String payeeName = 'avanti';
  String amount = '10.00';
  String note = 'Test';
  bool showQrCode = false;

  void generateQrCode() {
    setState(() {
      showQrCode = true;
    });
  }

  void closeQrCode() {
    setState(() {
      showQrCode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showQrCode)
              QrImage(
                data:
                    'upi://pay?pa=$upiId&pn=$payeeName&mc=&tid=&tr=&tn=$note&am=$amount&cu=INR',
                version: QrVersions.auto,
                size: 200.0,
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: generateQrCode,
              child: const Text('Generate QR Code'),
            ),
            ElevatedButton(
              onPressed: closeQrCode,
              child: const Text('Close QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
