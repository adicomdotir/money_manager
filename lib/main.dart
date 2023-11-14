import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_manager/config/names.dart';
import 'package:money_manager/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fa'), // Persian
      ],
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IranYekan',
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color(0xFFF50057),
        ),
      ),
      initialRoute: ScreenNames.addTransactionScreen,
      routes: routes,
    );
  }
}
