import 'package:bloc_demo/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_demo/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(
      WishlistInitialEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Item'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistRemoveActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 100),
                backgroundColor: Colors.black,
                content: Text(
                  'Wishlist Item Is Removed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSucessState:
              final successState = state as WishlistSucessState;
              if (successState.wishlistItem.isEmpty) {
                return const Center(child: Text('No Dated Added'));
              } else {
                return ListView.builder(
                  itemCount: successState.wishlistItem.length,
                  itemBuilder: (context, index) {
                    return WishlistTile(
                      productDataModel: successState.wishlistItem[index],
                      wishlistBloc: wishlistBloc,
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
