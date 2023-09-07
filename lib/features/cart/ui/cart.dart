import 'package:bloc_demo/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(
      CartInitialEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartRemoveActionSate) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  'Cart Item Is Removed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartScuessState:
              final successState = state as CartScuessState;
              if (successState.cartItems.isEmpty) {
                return const Center(child: Text('No Dated Added'));
              } else {
                return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      productDataModel: successState.cartItems[index],
                      cartBloc: cartBloc,
                    );
                  },
                );
              }
            default:
              return const SizedBox();
          }
          return Container();
        },
      ),
    );
  }
}
