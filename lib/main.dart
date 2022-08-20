import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_band_app_flutter/routes/pages.dart';
import 'package:too_band_app_flutter/routes/routes.dart';
import 'package:url_strategy/url_strategy.dart';

String getInintialRoute({bool debug = false}) {
  return debug ? Routes.TEST : Routes.HOME;
}

void main() {
  setPathUrlStrategy();
  runApp(
    GetMaterialApp(
      title: 'Zeping',
      initialRoute: getInintialRoute(debug: false),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E2124),
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 12, color: Color.fromRGBO(255, 255, 255, 0.4)),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
        scaffoldBackgroundColor: const Color(0xFF1E2124),
      ),
    ),
  );
}
