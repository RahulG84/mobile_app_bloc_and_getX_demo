import 'package:bloc_demo/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../home/models/home_products_models.dart';

class CartTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTile({
    Key? key,
    required this.productDataModel,
    required,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.00),
      padding: const EdgeInsets.all(10.00),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.brand,
            // textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            productDataModel.description,
            // textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${productDataModel.price}',
                // textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartBloc.add(
                        CartRemoveFromCart(productDataModel: productDataModel),
                      );
                    },
                    icon: const Icon(Icons.delete_outlined),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
