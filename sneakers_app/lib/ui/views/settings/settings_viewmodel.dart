import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';
import '../../../services/database_service.dart';
import '../../../services/theme_service.dart';

class SettingsViewModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();
  final _databaseService = locator<DatabaseService>();
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  ThemeMode get themeMode => _themeService.themeMode;

  SettingsViewModel() {
    _themeService.themeNotifier.addListener(notifyListeners);
  }

  void setThemeMode(ThemeMode? newThemeMode) {
    if (newThemeMode != null) {
      _themeService.setThemeMode(newThemeMode);
    }
  }


  /// UN_COMMENT THE BELOW FUNTION IF YOU WANT TO SEE THE DATABASE TABLES AND THERE DETAILS
  /// BEFORE IT YOU NEED TO UNCOMMENT THE CODE ON DATABASE SERVICE
  /// AFTER IN SETTING VIEW

  // Future<void> showDatabaseTables(BuildContext context) async {
  //   final tables = await _databaseService.showTables();
  //   await _dialogService.showDialog(
  //     title: 'Database Tables',
  //     description: tables.isEmpty ? 'No tables found' : tables.join('\n'),
  //     buttonTitle: 'OK',
  //   );
  //   final dbService = DatabaseService();
  //   await dbService.logAllTableData();
  //
  // }

  Future<void> logout(BuildContext context) async {
    _authService.logout();
    await _navigationService.replaceWithLoginView();
  }

  @override
  void dispose() {
    _themeService.themeNotifier.removeListener(notifyListeners);
    super.dispose();
  }
}