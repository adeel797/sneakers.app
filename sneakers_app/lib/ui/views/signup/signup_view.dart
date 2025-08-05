import 'package:flutter/material.dart';
import 'package:sneakers_app/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../common/ui_helpers.dart';
import '../../components/auth_toggle_text.dart';
import '../../components/divider_line.dart';
import '../../components/my_button.dart';
import '../../components/my_text_field.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({super.key});

  @override
  Widget builder(
      BuildContext context, SignupViewModel viewModel, Widget? child) {
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
                'Register',
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
              MyTextField(
                controller: viewModel.confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Icon(
                  Icons.password,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              verticalSpaceMedium,
              MyButton(
                onTap: viewModel.signUp,
                title: "Signup",
                icon: Icons.app_registration,
              ),
              verticalSpaceMedium,
              const DividerLine(),
              AuthToggleText(
                msg: "Already have an account?",
                title: 'Login',
                onPressed: viewModel.goBack,
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  SignupViewModel viewModelBuilder(BuildContext context) => SignupViewModel();
}
