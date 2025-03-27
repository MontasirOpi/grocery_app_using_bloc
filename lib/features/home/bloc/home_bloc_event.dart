part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickEvent extends HomeBlocEvent {
  final ProductDataMOdels clickProduct;

  HomeProductWishListButtonClickEvent({required this.clickProduct});
}

class HomeProductCartButtonClickEvent extends HomeBlocEvent {
  final ProductDataMOdels clickProduct;

  HomeProductCartButtonClickEvent({required this.clickProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}
