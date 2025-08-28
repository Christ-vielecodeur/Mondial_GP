import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mondial_gp_test/app/widgets/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mondial_gp_test/app/Modules/QrCode/controller.dart';

class QrcodeWidget extends StatelessWidget {
  QrcodeWidget({Key? key}) : super(key: key);

  final QRController qrController = Get.put(QRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(0, 15, 62, 1)),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Code généré',
          style: TextStyle(
            color: Color.fromRGBO(0, 15, 62, 1),
            fontSize: 18,
            fontFamily: 'Euclid Circular A',
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Section QR Code
                  _buildQrCodeSection(),
                  SizedBox(height: 24),

                  // Section PIN
                  _buildPinCodeSection(),
                  SizedBox(height: 32),

                  // Message info
                  _buildInfoMessage(),
                  SizedBox(height: 32),

                  // Bouton partager
                  _buildShareButton(),

                  Obx(
                    () =>
                        qrController.showShareMenu.value
                            ? SizedBox(height: 400)
                            : SizedBox(),
                  ),
                ],
              ),
            ),

            Obx(() {
              if (qrController.showShareMenu.value) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildShareMenu(),
                );
              } else {
                return SizedBox();
              }
            }),
          ],
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

  Widget _buildQrCodeSection() {
    return Obx(() {
      final pinCode = qrController.pinCode.value;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'Code QR',
              style: TextStyle(
                color: Color.fromRGBO(0, 15, 62, 1),
                fontSize: 20,
                fontFamily: 'Euclid Circular A',
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),

            // QR Code généré dynamiquement
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: QrImageView(
                data: pinCode,
                version: QrVersions.auto,
                size: 150.0,
                backgroundColor: Colors.grey[200]!,
                foregroundColor: Color.fromRGBO(0, 15, 62, 1),
              ),
            ),

            SizedBox(height: 10),
            Text(
              'Scannez ce code pour accéder aux détails',
              style: TextStyle(
                color: Color.fromRGBO(120, 128, 150, 1),
                fontSize: 14,
                fontFamily: 'Euclid Circular A',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPinCodeSection() {
    return Obx(() {
      final pinCode = qrController.pinCode.value;
      final isCopied = qrController.isCopied.value;

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'Code PIN',
              style: TextStyle(
                color: Color.fromRGBO(0, 15, 62, 1),
                fontSize: 16,
                fontFamily: 'Euclid Circular A',
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(236, 241, 250, 1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      pinCode,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 15, 62, 1),
                        fontSize: 18,
                        fontFamily: 'Euclid Circular A',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: qrController.copyPin,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isCopied ? Icons.check : Icons.content_copy,
                        size: 20,
                        color:
                            isCopied
                                ? Colors.green
                                : Color.fromRGBO(0, 15, 62, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              isCopied ? 'Code copié !' : 'Cliquez pour copier le code',
              style: TextStyle(
                color:
                    isCopied ? Colors.green : Color.fromRGBO(120, 128, 150, 1),
                fontSize: 14,
                fontFamily: 'Euclid Circular A',
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: Color.fromRGBO(120, 128, 150, 1),
            fontFamily: 'Euclid Circular A',
            fontSize: 15,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: 'Partagez ',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            TextSpan(text: 'ce code '),
            TextSpan(
              text: 'uniquement avec le destinataire ',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'afin qu\'il puisse récupérer son colis en toute sécurité.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareButton() {
    return Obx(() {
      final showShareMenu = qrController.showShareMenu.value;

      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: qrController.toggleShareMenu,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(33, 71, 185, 1),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share, size: 20),
              SizedBox(width: 12),
              Text(
                showShareMenu ? 'Masquer le menu' : 'Partager le code',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Euclid Circular A',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildShareMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 247, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section document
          _buildDocumentSection(),
          Divider(height: 1, color: Color.fromRGBO(60, 60, 67, 0.3)),

          // Section contacts
          _buildContactsSection(),
          Divider(height: 1, color: Color.fromRGBO(60, 60, 67, 0.3)),

          // Section applications
          _buildAppsSection(),
          Divider(height: 1, color: Color.fromRGBO(60, 60, 67, 0.3)),

          // Section actions
          _buildActionsSection(),

          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Annuler',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              onTap: qrController.toggleShareMenu,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 41,
            height: 41,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 122, 255, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.description, color: Colors.white, size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Code_Livraison.pdf',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'PDF Document',
                  style: TextStyle(
                    color: Color.fromRGBO(152, 151, 154, 1),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildContactsSection() {
    final contacts = [
      {'name': 'Hugo Collins', 'icon': Icons.person},
      {'name': 'Laura Scott', 'icon': Icons.person},
      {'name': 'Anne Frank', 'icon': Icons.person},
      {'name': 'Jasper Jacobs', 'icon': Icons.person},
      {'name': 'Maik\'s Macbook', 'icon': Icons.laptop},
    ];

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              contacts.map((contact) {
                return Container(
                  width: 70,
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(215, 215, 215, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          contact['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        contact['name']!.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildAppsSection() {
    final apps = [
      {'name': 'Message', 'icon': Icons.message, 'color': Colors.blue},
      {'name': 'Mail', 'icon': Icons.mail, 'color': Colors.blue},
      {'name': 'Messenger', 'icon': Icons.chat_bubble, 'color': Colors.blue},
      {'name': 'WhatsApp', 'icon': Icons.chat, 'color': Colors.green},
      {'name': 'Twitter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    ];

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              apps.map((app) {
                return GestureDetector(
                  onTap:
                      () => qrController.shareViaApp(app['name']!.toString()),
                  child: Container(
                    width: 70,
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: app['color'] as Color,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            app['icon'] as IconData,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          app['name']!.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildActionsSection() {
    final actions = [
      {'name': 'Copy', 'icon': Icons.content_copy},
      {'name': 'Add to reading list', 'icon': Icons.bookmark_border},
    ];

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children:
            actions.map((action) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(
                      action['icon'] as IconData,
                      color: Colors.blue,
                    ),
                    title: Text(action['name']!.toString()),
                    onTap: () {
                      if (action['name'] == 'Copy') {
                        qrController.copyPin();
                        qrController.toggleShareMenu();
                      }
                    },
                  ),
                  if (action != actions.last) Divider(height: 1),
                ],
              );
            }).toList(),
      ),
    );
  }
}
