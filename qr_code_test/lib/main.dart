import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UpiQrCodeGenerator(),
    );
  }
}

class UpiQrCodeGenerator extends StatefulWidget {
  const UpiQrCodeGenerator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpiQrCodeGeneratorState createState() => _UpiQrCodeGeneratorState();
}

class _UpiQrCodeGeneratorState extends State<UpiQrCodeGenerator> {
  String upiId = '5510015222245@yesbankltd';
  String payeeName = 'avanti';
  String amount = '10.00';
  String note = 'Test';
  bool showQrCode = false;

  void generateQrCode() {
    /*
    String upiString =
        'upi://pay?pa=$upiId&pn=$payeeName&mc=&tid=&tr=&tn=$note&am=$amount&cu=INR';
    */
    setState(() {
      showQrCode = true;
    });

    // Use the generated UPI string for further processing or display the QR code.
    //print(upiString);
  }

  void closeQrCode() {
    setState(() {
      showQrCode = false;
    });

    // Use the generated UPI string for further processing or display the QR code.
    //print(upiString);
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
