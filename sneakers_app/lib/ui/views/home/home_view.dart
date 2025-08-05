import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../components/my_bottom_nav.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          viewModel.getTitle(),
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: MyBottomNav(
        onTabChange: viewModel.navigateBottomBar,
        selectedIndex: viewModel.selectedIndex,
      ),
      body: viewModel.screens[viewModel.selectedIndex],
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
