import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class QRController extends GetxController {
  RxString pinCode = ''.obs;

  RxBool isCopied = false.obs;

  RxBool showShareMenu = false.obs;

  @override
  void onInit() {
    super.onInit();
    generatePin();
  }

  void generatePin({int length = 8}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rnd = Random();
    pinCode.value = String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  void copyPin() {
    Clipboard.setData(ClipboardData(text: pinCode.value));
    isCopied.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isCopied.value = false;
    });
  }

  void toggleShareMenu() {
    showShareMenu.value = !showShareMenu.value;
  }

  void shareViaApp(String appName) {
    print('Partager via $appName: ${pinCode.value}');
  }

  String get qrData => pinCode.value;
}
