import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/views/accueil.dart';
import 'package:mondial_gp_test/app/widgets/blue_button.dart';
import 'package:mondial_gp_test/app/widgets/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _selectedProfile = "transporteur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "MondialGP",
                style: TextStyle(
                  fontFamily: "Sen",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Column(
                children: [
                  const Spacer(flex: 1),

                  const Text(
                    "Choix du profil",
                    style: TextStyle(
                      fontFamily: "Euclid Circular A",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildProfileCard(
                            title: "Demandeur",
                            image: "assets/images/Image20.png",
                            value: "demandeur",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildProfileCard(
                            title: "Transporteur",
                            image: "assets/images/Image.png",
                            value: "transporteur",
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BlueButton(
                      text: "Basculer",
                      onPressed: () {
                        debugPrint("Profil choisi : $_selectedProfile");
                        Get.offAll(
                          () => const HomePage(),
                          arguments: {"profil": _selectedProfile},
                        );
                      },
                    ),
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String title,
    required String image,
    required String value,
  }) {
    final isSelected = _selectedProfile == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedProfile = value;
        });
      },
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : AppColors.white,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Euclid Circular A",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.primaryBlue : Colors.transparent,
                    border: Border.all(color: AppColors.grey, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child:
                      isSelected
                          ? const Icon(
                            Icons.check,
                            size: 12,
                            color: AppColors.white,
                          )
                          : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
