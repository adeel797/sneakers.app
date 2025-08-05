import 'package:sneakers_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../services/database_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future runStartupLogic() async {
    await _databaseService.initDatabase();
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithLoginView();
  }
}
