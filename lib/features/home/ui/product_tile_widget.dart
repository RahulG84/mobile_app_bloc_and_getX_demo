import 'package:bloc_demo/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/counter.dart';
import '../models/home_products_models.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  ProductTile(
      {Key? key,
      required this.productDataModel,
      required,
      required this.homeBloc})
      : super(key: key);

  final CounterService counterService = Get.find<CounterService>();

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
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel));
                      counterService.increment();
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
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
