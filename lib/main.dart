import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/navigation/router.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'generated/l10n.dart';

void main() {
  initServiceLocator();
  runApp(const MechalodonApp());
}

class MechalodonApp extends StatelessWidget {
  const MechalodonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MechRouter router = MechRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          splashColor: Colors.transparent,
          primaryColorLight: Colors.white,
          unselectedWidgetColor: MechColor.inactive,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: const TextStyle(color: Colors.black),elevation: 0),textSelectionTheme: const TextSelectionThemeData(
                selectionColor: MechColor.primary,
                
              )),
              
      routeInformationProvider: router.infoProvider,
      routerDelegate: router.delegate,
      routeInformationParser: router.infoParser,
    );
  }
}
