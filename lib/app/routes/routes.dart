import 'package:get/get.dart';
import 'package:mondial_gp_test/app/views/welcome.dart';
import 'package:mondial_gp_test/app/views/accueil.dart ';
import 'package:mondial_gp_test/app/Modules/details/detailsPage.dart';
import 'package:mondial_gp_test/app/Modules/QrCode/qrcodes.dart';

class Routes {
  static const String welcome = '/welcome';
  static const String accueil = '/accueil';
  static const String details = '/details';
  static const String qrcode = '/qrcode';

  static final main = [
    GetPage(
      name: welcome,
      page: () => WelcomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: accueil,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: details,
      page: () => DetailpageWidget(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: qrcode,
      page: () => QrcodeWidget(),
      transition: Transition.fadeIn,
    ),
  ];
}
