import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/grocery_data.dart';
import 'package:grocery_app/features/home/models/home_product_data_models.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickEvent>(
      homeProductWishListButtonClickEvent,
    );
    on<HomeProductCartButtonClickEvent>(
      homeProductCartButtonClickEvent,
    );
    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent,
    );
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      HomeLoadingSuccessState(
        products:
            GroceryData().groceryProducts
                .map(
                  (e) => ProductDataMOdels(
                    id: e['id'],
                    name: e['name'],
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl'],
                  ),
                )
                .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishListButtonClickEvent(
    HomeProductWishListButtonClickEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('wishlist product clicked');
  }

  FutureOr<void> homeProductCartButtonClickEvent(
    HomeProductCartButtonClickEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('cart product clicked');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('wishlist navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
