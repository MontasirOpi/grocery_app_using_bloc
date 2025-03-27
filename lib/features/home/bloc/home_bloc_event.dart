part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeProductWishListButtonClickEvent extends HomeBlocEvent {
  
}
class HomeProductCartButtonClickEvent extends HomeBlocEvent {
  
}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent {
  
}
class HomeCartButtonNavigateEvent extends HomeBlocEvent {
  
}
