import 'package:get/get.dart';
import 'package:mondial_gp_test/app/views/welcome.dart';
import 'package:mondial_gp_test/app/views/accueil.dart ';
import 'package:mondial_gp_test/app/Modules/details/detailsPage.dart';
import 'package:mondial_gp_test/app/Modules/QrCode/qrcodes.dart';
import 'package:mondial_gp_test/app/Modules/details/detailsPage2.dart';
import 'package:mondial_gp_test/app/Modules/details/changerStatut.dart';
import 'package:mondial_gp_test/app/Modules/colis/remiColis.dart';

class Routes {
  static const String welcome = '/welcome';
  static const String accueil = '/accueil';
  static const String details = '/details';
  static const String details2 = '/details2';
  static const String qrcode = '/qrcode';
  static const String changerStatut = '/changerStatut';
  static const String remisColis = '/remisColis';

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
      page: () => DetailPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: details2,
      page: () => Dtail2Pages(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: qrcode,
      page: () => QrcodeWidget(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: changerStatut,
      page: () => StatusSelectionWidget(currentStatus: "En préparation"),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: remisColis,
      page: () => RemiscolisPage(),
      transition: Transition.downToUp,
    ),
  ];
}
