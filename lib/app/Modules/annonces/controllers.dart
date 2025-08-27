import 'package:get/get.dart';
import 'models.dart';

class HomeController extends GetxController {
  final RxInt travelingParcels = 2.obs;
  final RxInt deliveredParcels = 5.obs;

  final RxInt bottomIndex = 0.obs;

  final List<Announcement> announcements = <Announcement>[
    Announcement(
      fromCountryFlag: "🇸🇳",
      fromCity: "Dakar, Sen",
      fromDate: "22 Nov, 2024",
      toCountryFlag: "🇫🇷",
      toCity: "Paris, France",
      toDate: "23 Nov, 2024",
      receivedKg: 10,
      availableKg: 14,
      pricePerKg: "5€ par Kg",
      senders: 3,
      requests: 1,
      expiresIn: "0j 23h",
      contents: "Vêtements, cosmétiques",
    ),
    Announcement(
      fromCountryFlag: "🇫🇷",
      fromCity: "Paris, France",
      fromDate: "22 Nov, 2024",
      toCountryFlag: "🇸🇳",
      toCity: "Dakar, Sen",
      toDate: "23 Nov, 2024",
      receivedKg: 10,
      availableKg: 14,
      pricePerKg: "5€ par Kg",
      senders: 3,
      requests: 1,
      expiresIn: "5j 23h",
      contents: "Accessoires électroniques",
    ),
  ];
}
