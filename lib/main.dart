import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/navigation/router.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: router.infoProvider,
      routerDelegate: router.delegate,
      routeInformationParser: router.infoParser,
    );
  }
}
