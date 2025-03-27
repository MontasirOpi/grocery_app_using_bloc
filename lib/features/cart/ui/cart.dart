import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart_tile_widget.dart';
import 'package:grocery_app/features/home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cardBloc = CartBloc();
  @override
  void initState() {
    cardBloc.add( CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cardBloc,
        listener: (context, state) {
         
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch(state.runtimeType){
            case CartSuccessState:
            final successState = state as CartSuccessState;
            return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cardBloc,
                    productDataMOdels: successState.cartItems[index],
                  );
                },
              );
          }
          return const Center(child: Text('No items in the cart.'));
        },
      ),
    );
  }
}
