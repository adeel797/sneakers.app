import 'package:flutter/material.dart';
import 'package:sneakers_app/ui/common/ui_helpers.dart';
import 'package:sneakers_app/ui/components/my_button.dart';
import 'package:stacked/stacked.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget builder(
      BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Theme", style: TextStyle(fontSize: 18)),
            verticalSpaceSmall,



            RadioListTile<ThemeMode>(
              title: const Text("Light"),
              value: ThemeMode.light,
              groupValue: viewModel.themeMode,
              onChanged: viewModel.setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              title: const Text("Dark"),
              value: ThemeMode.dark,
              groupValue: viewModel.themeMode,
              onChanged: viewModel.setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              title: const Text("System Default"),
              value: ThemeMode.system,
              groupValue: viewModel.themeMode,
              onChanged: viewModel.setThemeMode,
            ),



            /// UN_COMMENT THE BELOW FUNTION IF YOU WANT TO SEE THE DATABASE TABLES AND THERE DETAILS
            /// BEFORE IT YOU NEED TO UNCOMMENT THE CODE ON DATABASE SERVICE AND SETTINGS VIEWMODEL
            // verticalSpaceMedium,
            // ElevatedButton(
            //   onPressed: () => viewModel.showDatabaseTables(context),
            //   child: const Text("Show Database Tables"),
            // ),

            // Inside the Column
            verticalSpaceMedium,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  onTap: () => viewModel.logout(context),
                  title: "Logout",
                  icon: Icons.logout,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();
}