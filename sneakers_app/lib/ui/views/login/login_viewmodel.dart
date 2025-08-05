import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _navService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  void signUserIn() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _dialogService.showDialog(
        title: 'Error',
        description: 'Please fill in all fields',
      );
      return;
    }

    final user = await _authService.login(username, password);
    if (user != null) {
      _navService.replaceWithHomeView();
    } else {
      _dialogService.showDialog(
        title: 'Login Failed',
        description: 'Invalid username or password',
      );
    }
  }

  void signupView() {
    _navService.navigateToSignupView();
  }
}
