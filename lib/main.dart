import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    MechRouter router = MechRouter();
    return MaterialApp.router(
      builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? Container());
      },
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
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(),
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          splashColor: Colors.transparent,
          primaryColorLight: Colors.white,
          unselectedWidgetColor: MechColor.inactive,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: const TextStyle(color: Colors.black),
              elevation: 0),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: MechColor.primary,selectionHandleColor: MechColor.primary,selectionColor: const Color(0x55555555))
          ),
      routeInformationProvider: router.infoProvider,
      routerDelegate: router.delegate,
      routeInformationParser: router.infoParser,
    );
  }
}
