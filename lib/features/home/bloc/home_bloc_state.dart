part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}
abstract class HomeActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadingSuccessState extends HomeBlocState {
  final List<ProductDataMOdels> products;

  HomeLoadingSuccessState({required this.products});
}

class HomeErrorState extends HomeBlocState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}