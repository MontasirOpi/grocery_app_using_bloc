import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart.dart';
import 'package:grocery_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:grocery_app/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,

      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cart()),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Wishlist()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          case HomeLoadingSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Grocery App',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                  ),
                ],
              ),
              body: const Center(
                child: Text('Welcome to Grocery App'),
              ),
            );

          case HomeErrorState():
            return Scaffold(body: const Center(child: Text('Error')));
          default:
          return const SizedBox();
        }
      },
    );
  }
}
