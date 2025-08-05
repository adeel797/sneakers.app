import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../views/shop/shop_viewmodel.dart';
import '../../components/shoe_tile.dart';

class SeeAllView extends StackedView<ShopViewModel> {
  const SeeAllView({super.key});

  @override
  Widget builder(
      BuildContext context, ShopViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "See All Products",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: viewModel.shoeList.length,
        itemBuilder: (context, index) {
          final shoe = viewModel.shoeList[index];
          return ShoeTile(
            shoeModel: shoe,
            onTap: () => viewModel.addToCart(shoe),
          );
        },
      ),
    );
  }

  @override
  ShopViewModel viewModelBuilder(BuildContext context) => ShopViewModel();
}