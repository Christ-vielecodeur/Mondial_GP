import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/views/accueil.dart';

class DonePage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildIOSStatusBar(),
            SizedBox(height: screenHeight * 0.08),

            _buildConfirmationImage(screenWidth),
            SizedBox(height: screenHeight * 0.06),

            _buildConfirmationText(screenWidth),
            SizedBox(height: screenHeight * 0.05),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: _buildConfirmButton(screenWidth, screenHeight),
            ),
          ],
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

  Widget _buildConfirmationImage(double screenWidth) {
    return Image.asset(
      'assets/images/done1.png',
      width: screenWidth * 0.6,
      height: screenWidth * 0.6,
      fit: BoxFit.cover,
    );
  }

  Widget _buildConfirmationText(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        children: [
          Text(
            'Colis livré !',
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
            'Le colis de Clara Bernard a été marqué comme livré. L’expéditeur a été notifié.',
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
          print('Confirmation validée');
          Get.offAll(HomePage());
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
        child: Text('Retour au tableau de bord'),
      ),
    );
  }
}
