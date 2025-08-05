import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneakers_app/services/theme_service.dart';
import 'package:sneakers_app/themes/dark_mode.dart';
import 'package:sneakers_app/themes/light_mode.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.bottomsheets.dart';
import 'app/app.dialogs.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await setupLocator();
  final themeService = locator<ThemeService>();
  await themeService.loadTheme();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MainApp(themeService: themeService));
}

class MainApp extends StatelessWidget {
  final ThemeService? themeService;

  const MainApp({super.key, this.themeService});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeService!.themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sneakers App',
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: mode,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver],
        );
      },
    );
  }
}
