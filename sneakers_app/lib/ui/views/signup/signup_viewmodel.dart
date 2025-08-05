import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';

class SignupViewModel extends BaseViewModel {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  void goBack() {
    _navigationService.back();
  }

  void signUp() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _dialogService.showDialog(
        title: 'Error',
        description: 'Please fill in all fields',
      );
      return;
    }

    if (password != confirmPassword) {
      _dialogService.showDialog(
        title: 'Error',
        description: 'Passwords do not match',
      );
      return;
    }

    final success = await _authService.register(username, password);
    if (success) {
      _navigationService.replaceWithHomeView();
    } else {
      _dialogService.showDialog(
        title: 'Registration Failed',
        description: 'Username already exists',
      );
    }
  }
}
