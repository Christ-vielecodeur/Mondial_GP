import 'package:get/get.dart';
import 'package:mondial_gp_test/app/views/welcome.dart';

class Routes {
  static const String welcome = '/welcome';

  static final main = [
    GetPage(
      name: welcome,
      page: () => WelcomePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
