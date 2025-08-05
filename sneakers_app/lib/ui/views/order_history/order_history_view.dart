import 'package:flutter/material.dart';
import 'package:sneakers_app/ui/components/order_tile.dart';
import 'package:stacked/stacked.dart';
import 'order_history_viewmodel.dart';
import '../../components/cart_tile.dart';
import '../../common/ui_helpers.dart';

class OrderHistoryView extends StackedView<OrderHistoryViewModel> {
  const OrderHistoryView({super.key});

  @override
  Widget builder(
      BuildContext context, OrderHistoryViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: viewModel.orders.isEmpty
          ? const Center(child: Text("No orders yet."))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: viewModel.orders.length,
        itemBuilder: (context, index) {
          final order = viewModel.orders[index];
          return ExpansionTile(
            title: Text(
              'Order #${order.displayOrderNumber ?? 1} - PKR ${order.totalPrice.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Placed on: ${order.orderDate.toString().substring(0, 10)}'),
            children: order.items
                .map((item) => OrderTile(
              shoe: item.shoe,
              quantity: item.quantity,
            ))
                .toList(),
          );
        },
      ),
    );
  }

  @override
  OrderHistoryViewModel viewModelBuilder(BuildContext context) => OrderHistoryViewModel();
}