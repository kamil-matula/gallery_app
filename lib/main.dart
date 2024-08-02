import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/core/dependency_injection.dart';
import 'package:gallery_app/views/main_page/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  // Disable Landscape Mode:
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainPage(),
    );
  }
}
