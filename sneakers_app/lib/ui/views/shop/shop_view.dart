import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'shop_viewmodel.dart';
import '../../components/shoe_tile.dart';

class ShopView extends StackedView<ShopViewModel> {
  const ShopView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ShopViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Step into Style: Your Ultimate Sneaker Adventure Awaits!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Shoes",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                GestureDetector(
                  onTap: viewModel.seeAllView,
                  child: const Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                final shoe = viewModel.shoeList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 220.0),
                  child: ShoeTile(
                    shoeModel: shoe,
                    onTap: () => viewModel.addToCart(shoe),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  ShopViewModel viewModelBuilder(BuildContext context) => ShopViewModel();
}
