import 'package:get/get.dart';
import 'package:mondial_gp_test/app/views/welcome.dart';
import 'package:mondial_gp_test/app/views/accueil.dart ';

class Routes {
  static const String welcome = '/welcome';
  static const String accueil = '/accueil';

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
  ];
}
