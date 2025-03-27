part of 'cart_bloc.dart';


sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent{
  final ProductDataMOdels productDataMOdels;

  CartRemoveFromCartEvent({required this.productDataMOdels});
}
