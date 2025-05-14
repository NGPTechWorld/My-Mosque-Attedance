import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_mosque_attedance/app/config/color_manager.dart';
import 'package:my_mosque_attedance/app/config/style_manager.dart';

class QRScannerScreen extends StatefulWidget {
  final Function(String) onDetect;

  const QRScannerScreen({super.key, required this.onDetect});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController cameraController = MobileScannerController();
  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "امسح الباركود",
          style: StyleManager.h3_Bold(color: ColorManager.blackColor),
        ),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              if (isScanned) return;
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final String? value = barcode.rawValue;
                if (value != null) {
                  isScanned = true;
                  widget.onDetect(value);
                  Navigator.of(context).pop();
                  break;
                }
              }
            },
          ),

          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.firstColor, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
