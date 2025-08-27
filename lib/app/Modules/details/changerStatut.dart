import 'package:flutter/material.dart';

class StatusSelectionWidget extends StatefulWidget {
  final String currentStatus;

  const StatusSelectionWidget({Key? key, required this.currentStatus})
    : super(key: key);

  @override
  _StatusSelectionWidgetState createState() => _StatusSelectionWidgetState();
}

class _StatusSelectionWidgetState extends State<StatusSelectionWidget> {
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            _buildStatusOption(
              title: "En préparation",
              color: Color.fromRGBO(45, 97, 255, 1),
              isSelected: _selectedStatus == "En préparation",
              onTap: () => _selectStatus("En préparation"),
            ),

            Divider(height: 1, color: Color.fromRGBO(207, 217, 231, 1)),

            _buildStatusOption(
              title: "En Transit",
              color: Color.fromRGBO(224, 124, 68, 1),
              isSelected: _selectedStatus == "En Transit",
              onTap: () => _selectStatus("En Transit"),
            ),

            Divider(height: 1, color: Color.fromRGBO(207, 217, 231, 1)),

            _buildStatusOption(
              title: "Colis remis",
              color: Color.fromRGBO(44, 150, 38, 1),
              isSelected: _selectedStatus == "Colis remis",
              onTap: () => _selectStatus("Colis remis"),
            ),

            SizedBox(height: 20),

            _buildValidateButton(),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Changer de statut',
            style: TextStyle(
              color: Color.fromRGBO(0, 15, 62, 1),
              fontFamily: 'Euclid Circular A',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, size: 24),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusOption({
    required String title,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              SizedBox(width: 16),

              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 15, 62, 1),
                    fontFamily: 'Euclid Circular A',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ),

              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelected
                            ? Color.fromRGBO(33, 71, 185, 1)
                            : Color.fromRGBO(97, 97, 97, 1),
                    width: 1.5,
                  ),
                  color: Colors.white,
                ),
                child:
                    isSelected
                        ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(33, 71, 185, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValidateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(33, 71, 185, 1),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Navigator.pop(context, _selectedStatus);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            child: Center(
              child: Text(
                'Valider',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Euclid Circular A',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectStatus(String status) {
    setState(() {
      _selectedStatus = status;
    });
  }
}
