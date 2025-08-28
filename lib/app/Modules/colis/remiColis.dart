import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/Modules/colis/remiColisQr.dart';
import 'dart:io';

class RemiscolisPage extends StatefulWidget {
  @override
  _RemiscolisWidgetState createState() => _RemiscolisWidgetState();
}

class _RemiscolisWidgetState extends State<RemiscolisPage> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
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
              _buildSenderCard(screenWidth),
              SizedBox(height: screenHeight * 0.03),
              _buildPhotoCard(screenWidth),
              SizedBox(height: screenHeight * 0.05),
              _buildNextButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
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
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: SvgPicture.asset(
                'assets/images/vector1.svg',
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
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

  Widget _buildSenderCard(double screenWidth) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expéditeur du colis',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            children: [
              Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Image.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Text(
                  'Clara Bernard',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 15, 62, 1),
                    fontFamily: 'Euclid Circular A',
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: screenWidth * 0.08,
                color: Color.fromRGBO(0, 15, 62, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoCard(double screenWidth) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prendre une photo du colis',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: _takePhoto,
              child: Container(
                width: screenWidth * 0.6,
                height: screenWidth * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color.fromRGBO(245, 247, 250, 1),
                  border: Border.all(
                    color: Color.fromRGBO(207, 217, 231, 1),
                    width: 1,
                  ),
                  image:
                      _pickedImage != null
                          ? DecorationImage(
                            image: FileImage(_pickedImage!),
                            fit: BoxFit.cover,
                          )
                          : null,
                ),
                child:
                    _pickedImage == null
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Color.fromRGBO(33, 71, 185, 1),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Appuyez pour prendre\nune photo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(33, 71, 185, 1),
                                fontFamily: 'Euclid Circular A',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                        : null,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'La photo doit montrer clairement le colis\net son état',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1),
                fontFamily: 'Euclid Circular A',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(double screenWidth, double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => RemiscolisQRPage());
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
