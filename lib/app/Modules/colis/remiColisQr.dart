import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/Modules/colis/confirmation.dart';

class RemiscolisQRPage extends StatefulWidget {
  @override
  _RemiscolisWidgetState createState() => _RemiscolisWidgetState();
}

class _RemiscolisWidgetState extends State<RemiscolisQRPage> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _codeController = TextEditingController();

  Future<void> _openQRScanner() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(screenWidth),
              SizedBox(height: screenHeight * 0.03),

              // Texte d'instruction
              _buildInstructionText(),
              SizedBox(height: screenHeight * 0.06),

              // Bouton Scanner QR
              _buildQRScanButton(screenWidth),
              SizedBox(height: screenHeight * 0.10),

              // Séparateur "ou"
              _buildSeparator(),
              SizedBox(height: screenHeight * 0.10),

              // Champ de texte pour code manuel
              _buildCodeInputField(screenWidth),
              SizedBox(height: screenHeight * 0.25),

              // Bouton Suivant
              _buildNextButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Icon(
                Icons.arrow_back,
                size: screenWidth * 0.07,
                color: Color.fromRGBO(0, 15, 62, 1),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Remise du colis',
                style: TextStyle(
                  color: Color.fromRGBO(0, 15, 62, 1),
                  fontFamily: 'Euclid Circular A',
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.08),
        ],
      ),
    );
  }

  Widget _buildInstructionText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          'Pour confirmer remettre le colis\nde Clara Bernard, veuillez scanner\nle code QR ou entrer le code',
          style: TextStyle(
            color: Color.fromRGBO(0, 15, 62, 1),
            fontFamily: 'Euclid Circular A',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildQRScanButton(double screenWidth) {
    return Center(
      child: GestureDetector(
        onTap: _openQRScanner,
        child: Container(
          width: screenWidth * 0.8,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(33, 71, 185, 1), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code_scanner,
                size: 24,
                color: Color.fromRGBO(33, 71, 185, 1),
              ),
              SizedBox(width: 12),
              Text(
                'Scanner le code QR',
                style: TextStyle(
                  color: Color.fromRGBO(33, 71, 185, 1),
                  fontFamily: 'Euclid Circular A',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Color.fromRGBO(16, 17, 18, 1), thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'ou',
            style: TextStyle(
              color: Color.fromRGBO(16, 17, 18, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Color.fromRGBO(16, 17, 18, 1), thickness: 1),
        ),
      ],
    );
  }

  Widget _buildCodeInputField(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          controller: _codeController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Entrez le code ici',
            hintStyle: TextStyle(
              color: Color.fromRGBO(102, 102, 102, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: 14,
            ),
          ),
          style: TextStyle(
            color: Color.fromRGBO(0, 15, 62, 1),
            fontFamily: 'Euclid Circular A',
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(double screenWidth, double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => ConfirmationPage());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(33, 71, 185, 1),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.08,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          textStyle: TextStyle(
            fontFamily: 'Euclid Circular A',
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        child: Text('Suivant'),
      ),
    );
  }
}
