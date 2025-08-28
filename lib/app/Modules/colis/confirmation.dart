import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/Modules/colis/donePage.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
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
            children: [
              _buildIOSStatusBar(),
              _buildHeader(screenWidth),
              SizedBox(height: screenHeight * 0.05),

              _buildConfirmationImage(screenWidth),
              SizedBox(height: screenHeight * 0.06),

              _buildConfirmationText(screenWidth),

              SizedBox(height: screenHeight * 0.1),

              _buildConfirmButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIOSStatusBar() {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, size: 14),
              SizedBox(width: 4),
              Icon(Icons.wifi, size: 14),
              SizedBox(width: 4),
              Icon(Icons.battery_full, size: 14),
            ],
          ),
        ],
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
                'Confirmation',
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
          SizedBox(width: screenWidth * 0.11),
        ],
      ),
    );
  }

  Widget _buildConfirmationImage(double screenWidth) {
    return Container(
      width: screenWidth * 0.6,
      height: screenWidth * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
        image: DecorationImage(
          image: AssetImage('assets/images/colis.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildConfirmationText(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        children: [
          Text(
            'Voulez-vous confirmer la remise du colis de Clara Bernard ?',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenWidth * 0.08),
          Text(
            'Contenant du colis\nVetements, cosmetiques, electronique',
            style: TextStyle(
              color: Color.fromRGBO(102, 102, 102, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w500,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton(double screenWidth, double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => DonePage());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(33, 71, 185, 1),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.022,
            horizontal: screenWidth * 0.08,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          textStyle: TextStyle(
            fontFamily: 'Euclid Circular A',
            fontSize: screenWidth * 0.042,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        child: Text('Confirmer maintenant'),
      ),
    );
  }
}
