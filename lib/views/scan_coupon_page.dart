import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/views/coupons_page.dart';
import 'package:flutter_babuland_app/views/scanned_coupon_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanCouponPage extends StatefulWidget {
  const ScanCouponPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<ScanCouponPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.red.shade500,
            child: const Center(
                child: Text(
              'Scan Your Coupon',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        //cutOutSize: scanArea
        cutOutHeight: 250,
        cutOutWidth: 250,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    // controller.scannedDataStream.listen((scanData) {
    //   setState(() {
    //     result = scanData;
    //   });
    // });
    late StreamSubscription subscription;
    subscription = controller.scannedDataStream.listen((scanData) {
      result = scanData;
      subscription.cancel();
      Navigator.pushNamed(context, 'scannedCouponPage',
          arguments: ScannedCouponPage(scannedData: scanData.code.toString()));
    });

    if (controller != null && mounted) {
      controller.pauseCamera();
      controller.resumeCamera();
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'No Camera Permission',
          textAlign: TextAlign.center,
        )),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
