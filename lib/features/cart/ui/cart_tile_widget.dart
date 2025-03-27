import 'package:flutter/material.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:grocery_app/features/home/models/home_product_data_models.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataMOdels productDataMOdels;
  final CartBloc cartBloc;
  const CartTileWidget({
    super.key,
    required this.productDataMOdels,  required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataMOdels.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productDataMOdels.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(productDataMOdels.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               'Tk ${productDataMOdels.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //  homeBloc.add(HomeProductWishListButtonClickEvent(
                      //   clickProduct: productDataMOdels,
                      //  ));
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(
                      productDataMOdels: productDataMOdels,
                    ));
                    },
                    icon: const Icon(Icons.add_shopping_cart),
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
