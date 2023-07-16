import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UpiQrCodeGeneratorTwoPage extends StatefulWidget {
  const UpiQrCodeGeneratorTwoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpiQrCodeGeneratorTwoState createState() => _UpiQrCodeGeneratorTwoState();
}

class _UpiQrCodeGeneratorTwoState extends State<UpiQrCodeGeneratorTwoPage> {
  final TextEditingController _upiIdController = TextEditingController();
  final TextEditingController _payeeController = TextEditingController();

  bool _showQrCode = false;

  Widget _generateQrCode() {
    String upiId = _upiIdController.text;
    String payee = _payeeController.text;

    String url = 'upi://pay?pa=$upiId&pn=$payee';

    return QrImage(
      data: url,
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  void closeQrCode() {
    setState(() {
      _showQrCode = false;
    });

    // Use the generated UPI string for further processing or display the QR code.
    //print(upiString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate UPI QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _upiIdController,
              decoration: const InputDecoration(
                labelText: 'UPI ID',
              ),
            ),
            TextField(
              controller: _payeeController,
              decoration: const InputDecoration(
                labelText: 'Payee Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showQrCode = true;
                });
              },
              child: const Text('Generate QR Code'),
            ),
            Visibility(
              visible: _showQrCode,
              child: _generateQrCode(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showQrCode = false;
                });
              },
              child: const Text('Close QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
