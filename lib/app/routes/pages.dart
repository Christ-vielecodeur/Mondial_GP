import 'package:mondial_gp_test/app/views/welcome.dart';
import 'package:mondial_gp_test/app/views/accueil.dart ';
import 'package:mondial_gp_test/app/Modules/details/detailsPage.dart';
import 'package:mondial_gp_test/app/Modules/QrCode/qrcodes.dart';
import 'package:mondial_gp_test/app/Modules/details/detailsPage2.dart';
import 'package:mondial_gp_test/app/Modules/details/changerStatut.dart';

WelcomePage welcome = WelcomePage();
DetailPage details = DetailPage();
Dtail2Pages details2 = Dtail2Pages();
QrcodeWidget qrcode = QrcodeWidget();
HomePage accueil = HomePage();
StatusSelectionWidget changerStatut = StatusSelectionWidget(
  currentStatus: "En préparation",
);
