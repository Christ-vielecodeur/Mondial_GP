import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mondial_gp_test/app/Modules/details/changerStatut.dart';
import 'package:get/get.dart ';

class Dtail2Pages extends StatefulWidget {
  @override
  _Dtail2WidgetState createState() => _Dtail2WidgetState();
}

class _Dtail2WidgetState extends State<Dtail2Pages> {
  int _selectedTab = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _buildIOSStatusBar(),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 24),

                    _buildCard(
                      title: "Détail du vol",
                      icon: Icon(Icons.keyboard_arrow_down, size: 20),
                      child: Container(),
                    ),
                    SizedBox(height: 24),

                    _buildCard(
                      title: "Statistiques",
                      child: _buildStatistics(),
                    ),
                    SizedBox(height: 24),

                    _buildStatusCard(),
                    SizedBox(height: 24),

                    _buildSendersCard(),
                  ],
                ),
              ),
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

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: Color.fromRGBO(0, 15, 62, 1),
              ),
            ),
          ),

          Text(
            'Détails',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            children: List.generate(
              3,
              (index) => Container(
                width: 5,
                height: 5,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 15, 62, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    Widget? icon,
    required Widget child,
  }) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(0, 15, 62, 1),
                  fontFamily: 'Euclid Circular A',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (icon != null) icon,
            ],
          ),
          SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(value: "45", label: "Kg au total"),
        _buildStatItem(value: "135", label: "€ gagné"),
      ],
    );
  }

  Widget _buildStatItem({required String value, required String label}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value,
          style: TextStyle(
            color: Color.fromRGBO(33, 71, 185, 1),
            fontFamily: 'Euclid Circular A',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 0.9,
          ),
        ),
        SizedBox(width: 4),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  String _currentStatus = "En préparation";

  Color _getStatusColor(String status) {
    switch (status) {
      case "En préparation":
        return Color.fromRGBO(45, 97, 255, 1);
      case "En Transit":
        return Color.fromRGBO(224, 124, 68, 1);
      case "Colis remis":
        return Color.fromRGBO(44, 150, 38, 1);
      default:
        return Color.fromRGBO(45, 97, 255, 1);
    }
  }

  Widget _buildStatusCard() {
    return GestureDetector(
      onTap: () {
        _showStatusSelectionDialog();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Statut",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 15, 62, 1),
                    fontFamily: 'Euclid Circular A',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _getStatusColor(_currentStatus),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        _currentStatus,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Euclid Circular A',
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (_currentStatus == "Colis remis")
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: GestureDetector(
                    onTap: () {
                      print("Procéder à la remise");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Procéder à la remise",
                          style: TextStyle(
                            color: Color.fromRGBO(33, 71, 185, 1),
                            fontFamily: 'Euclid Circular A',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(33, 71, 185, 1),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Color.fromRGBO(33, 71, 185, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showStatusSelectionDialog() {
    showDialog(
      context: context,
      builder:
          (context) => StatusSelectionWidget(currentStatus: _currentStatus),
    ).then((selectedStatus) {
      if (selectedStatus != null) {
        setState(() {
          _currentStatus = selectedStatus;
        });
        print("Nouveau statut: $selectedStatus");
      }
    });
  }

  Widget _buildSendersCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(207, 217, 231, 1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Envoyeurs',
                                  style: TextStyle(
                                    color:
                                        _selectedTab == 0
                                            ? Color.fromRGBO(0, 15, 62, 1)
                                            : Color.fromRGBO(0, 15, 62, 0.5),
                                    fontFamily: 'Euclid Circular A',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color:
                                    _selectedTab == 0
                                        ? Color.fromRGBO(33, 71, 185, 1)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Demandes',
                                  style: TextStyle(
                                    color:
                                        _selectedTab == 1
                                            ? Color.fromRGBO(0, 15, 62, 1)
                                            : Color.fromRGBO(0, 15, 62, 0.5),
                                    fontFamily: 'Euclid Circular A',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color:
                                        _selectedTab == 1
                                            ? Color.fromRGBO(33, 71, 185, 1)
                                            : Color.fromRGBO(33, 71, 185, 0.5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Euclid Circular A',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color:
                                    _selectedTab == 1
                                        ? Color.fromRGBO(33, 71, 185, 1)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Color.fromRGBO(229, 237, 248, 1), height: 1),

          if (_selectedTab == 0)
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildSenderItem(
                    name: "Camille Dupont",
                    weight: "5kg",
                    content: "Vêtement et accessoires",
                    image: "assets/images/Image.png",
                  ),
                  Divider(color: Color.fromRGBO(229, 237, 248, 1)),
                  _buildSenderItem(
                    name: "Hélène Martin",
                    weight: "12kg",
                    content: "Nourritures",
                    initial: "H",
                    color: Color.fromRGBO(194, 108, 255, 1),
                  ),
                  Divider(color: Color.fromRGBO(229, 237, 248, 1)),
                  _buildSenderItem(
                    name: "Clara Bernard",
                    weight: "3kg",
                    content: "Vêtement et accessoires",
                    image: "assets/images/Image.png",
                  ),
                ],
              ),
            ),

          if (_selectedTab == 1)
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "Contenu des demandes",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 15, 62, 1),
                    fontFamily: 'Euclid Circular A',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSenderItem({
    required String name,
    required String weight,
    required String content,
    String? image,
    String? initial,
    Color? color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
            )
          else if (initial != null && color != null)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Center(
                child: Text(
                  initial,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 15, 62, 1),
                    fontFamily: 'Euclid Circular A',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'poids',
                          style: TextStyle(
                            color: Color.fromRGBO(55, 58, 59, 1),
                            fontFamily: 'Euclid Circular A',
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          weight,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 15, 62, 1),
                            fontFamily: 'Euclid Circular A',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'contenant du colis',
                            style: TextStyle(
                              color: Color.fromRGBO(55, 58, 59, 1),
                              fontFamily: 'Euclid Circular A',
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            content,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 15, 62, 1),
                              fontFamily: 'Euclid Circular A',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color.fromRGBO(33, 71, 185, 1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.chat,
                  size: 16,
                  color: Color.fromRGBO(33, 71, 185, 1),
                ),
                SizedBox(width: 4),
                Text(
                  'Chat',
                  style: TextStyle(
                    color: Color.fromRGBO(33, 71, 185, 1),
                    fontFamily: 'Euclid Circular A',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
