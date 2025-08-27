import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/routes/routes.dart';
import 'package:mondial_gp_test/app/Modules/annonces/controllers.dart';
import 'package:mondial_gp_test/app/Modules/QrCode/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise le QRController globalement
  Get.put(QRController());

  // Autres controllers
  Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MondialGP".tr,
      locale: const Locale("fr_FR"),
      initialRoute: '/welcome',
      getPages: Routes.main,
    );
  }
}
