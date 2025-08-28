import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/Modules/annonces/controllers.dart';
import 'package:mondial_gp_test/app/Modules/annonces/models.dart';
import 'package:mondial_gp_test/app/Modules/QrCode/qrcodes.dart';
import 'package:mondial_gp_test/app/Modules/details/detailsPage2.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final int announcementIndex = Get.arguments ?? 0;
    final announcement = homeController.announcements[announcementIndex];

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: _buildIOSStatusBar(),
              ),
              SizedBox(height: 20),
              _buildAppBar(),
              SizedBox(height: 16),
              _buildMainCard(announcement, announcementIndex),
              SizedBox(height: 24),
              _buildFlightDetailsSection(announcement),
              SizedBox(height: 24),
              _buildPorteurSection(),
              SizedBox(height: 24),
              _buildContenuSection(announcement),
              SizedBox(height: 24),
              _buildPhotosSection(),
              SizedBox(height: 32),
              _buildTrackingButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour créer la barre de statut iOS
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

  Widget _buildAppBar() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: Color.fromRGBO(0, 15, 62, 1),
          ),
          onPressed: () => Get.back(),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Détails',
              style: TextStyle(
                color: Color.fromRGBO(0, 15, 62, 1),
                fontSize: 18,
                fontFamily: 'Euclid Circular A',
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
          ),
        ),
        SizedBox(width: 48),
      ],
    );
  }

  Widget _buildMainCard(Announcement announcement, int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 247, 250, 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Colis N° ${4509534 + index}',
                style: TextStyle(
                  color: Color.fromRGBO(0, 15, 62, 1),
                  fontSize: 16,
                  fontFamily: 'Euclid Circular A',
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(218, 97, 41, 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'En Transit',
                    style: TextStyle(
                      color: Color.fromRGBO(218, 97, 41, 1),
                      fontSize: 14,
                      fontFamily: 'Euclid Circular A',
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => QrcodeWidget());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Générez le code QR et le code PIN',
                      style: TextStyle(
                        color: Color.fromRGBO(33, 71, 185, 1),
                        fontSize: 14,
                        fontFamily: 'Euclid Circular A',
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Color.fromRGBO(33, 71, 185, 1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Container(
                height: 2,
                width: 240, // j’ai élargi un peu pour inclure la flèche
                color: Color.fromRGBO(33, 71, 185, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlightDetailsSection(Announcement announcement) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Détail du vol',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontSize: 16,
              fontFamily: 'Euclid Circular A',
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20),

          // Départ
          _buildFlightDetailItem(
            title: 'Départ',
            city: announcement.fromCity,
            airport: 'Aéroport International Blaise Diagne (AIBD)',
            date: announcement.fromDate,
            icon: Icons.flight_takeoff,
            flag: announcement.fromCountryFlag,
          ),

          Divider(
            color: Color.fromRGBO(229, 237, 248, 1),
            height: 40,
            thickness: 1,
          ),

          // Arrivée
          _buildFlightDetailItem(
            title: 'Arrivé',
            city: announcement.toCity,
            airport: 'Aéroport Paris-Charles-de-Gaulle (CDG)',
            date: announcement.toDate,
            icon: Icons.flight_land,
            flag: announcement.toCountryFlag,
          ),
        ],
      ),
    );
  }

  Widget _buildFlightDetailItem({
    required String title,
    required String city,
    required String airport,
    required String date,
    required IconData icon,
    required String flag,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Color.fromRGBO(0, 15, 62, 1)),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(120, 128, 150, 1),
                  fontSize: 12,
                  fontFamily: 'Euclid Circular A',
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 4),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$flag ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Euclid Circular A',
                      ),
                    ),
                    TextSpan(
                      text: city,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 15, 62, 1),
                        fontSize: 16,
                        fontFamily: 'Euclid Circular A',
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4),
              Text(
                airport,
                style: TextStyle(
                  color: Color.fromRGBO(120, 128, 150, 1),
                  fontSize: 12,
                  fontFamily: 'Euclid Circular A',
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  color: Color.fromRGBO(120, 128, 150, 1),
                  fontSize: 12,
                  fontFamily: 'Euclid Circular A',
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPorteurSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Porteur',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontSize: 16,
              fontFamily: 'Euclid Circular A',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              // Avatar
              Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(Icons.person, size: 30, color: Colors.grey[600]),
              ),
              SizedBox(width: 12),

              // Informations du porteur
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Camille Dubois',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 15, 62, 1),
                        fontSize: 16,
                        fontFamily: 'Euclid Circular A',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6),

                    // Ligne inférieure (étoiles, certifié, message)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isSmallScreen = constraints.maxWidth < 350;

                        return Row(
                          children: [
                            // Note et avis
                            Flexible(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      isSmallScreen ? '5 (12)' : '5 (12 avis)',
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 15, 62, 1),
                                        fontSize: 12,
                                        fontFamily: 'Euclid Circular A',
                                        fontWeight: FontWeight.normal,
                                        height: 1.5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 8),

                            // Badge Certifié
                            Flexible(
                              flex: isSmallScreen ? 2 : 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSmallScreen ? 6 : 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(240, 240, 240, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  'Certifié',
                                  style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    fontSize: isSmallScreen ? 10 : 12,
                                    fontFamily: 'Euclid Circular A',
                                    fontWeight: FontWeight.normal,
                                    height: 1.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                            SizedBox(width: 8),

                            // Bouton Message
                            Flexible(
                              flex: isSmallScreen ? 3 : 2,
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: isSmallScreen ? 70 : 80,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSmallScreen ? 8 : 12,
                                  vertical: isSmallScreen ? 4 : 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 71, 185, 1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    'Message',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isSmallScreen ? 11 : 12,
                                      fontFamily: 'Euclid Circular A',
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContenuSection(Announcement announcement) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contenant du colis',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontSize: 16,
              fontFamily: 'Euclid Circular A',
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
          SizedBox(height: 8),
          Text(
            announcement.contents ?? 'Non spécifié',
            style: TextStyle(
              color: Color.fromRGBO(123, 130, 154, 1),
              fontSize: 14,
              fontFamily: 'Euclid Circular A',
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotosSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Photos du colis',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontSize: 16,
              fontFamily: 'Euclid Circular A',
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 105,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildPhotoPlaceholder(),
                SizedBox(width: 8),
                _buildPhotoPlaceholder(),
                SizedBox(width: 8),
                _buildPhotoPlaceholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoPlaceholder() {
    return Container(
      width: 129,
      height: 105,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(9.4),
        border: Border.all(color: Colors.grey[300]!),
        image: DecorationImage(
          image: AssetImage("assets/images/vetements.jpg"), // ton image
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTrackingButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => Dtail2Pages());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(33, 71, 185, 1),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        'Suivre le colis',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Euclid Circular A',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
