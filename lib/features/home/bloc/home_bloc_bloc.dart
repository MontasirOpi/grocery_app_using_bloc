import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
   on<HomeProductWishListButtonClickEvent>(homeProductWishListButtonClickEvent);
   on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
   on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
   on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishListButtonClickEvent(HomeProductWishListButtonClickEvent event, Emitter<HomeBlocState> emit) {
    print('wishlist product clicked');
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeBlocState> emit) {
    print('cart product clicked');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('wishlist navigate clicked');
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('cart navigate clicked');
  }
}
