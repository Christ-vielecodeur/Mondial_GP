import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      /*      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      //navigatorObservers: [GetObserver(Middleware.observer)],
      initialRoute: '/welcome',
      getPages: Routes.main,
    );
  }
}
