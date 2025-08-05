import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/ui_helpers.dart';
import '../../components/auth_toggle_text.dart';
import '../../components/divider_line.dart';
import '../../components/my_button.dart';
import '../../components/my_text_field.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).colorScheme.tertiary,
              ),
              verticalSpaceMedium,
              Text(
                'Welcome Back :)',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceMedium,
              MyTextField(
                controller: viewModel.usernameController,
                hintText: 'Username',
                obscureText: false,
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              verticalSpaceMedium,
              MyTextField(
                controller: viewModel.passwordController,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Icon(
                  Icons.password,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              verticalSpaceMedium,
              MyButton(
                onTap: viewModel.signUserIn,
                title: "Login",
                icon: Icons.login,
              ),
              verticalSpaceMedium,
              const DividerLine(),
              AuthToggleText(
                msg: "Don't have an account?",
                title: 'Register',
                onPressed: viewModel.signupView,
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
