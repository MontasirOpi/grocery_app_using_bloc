part of 'cart_bloc.dart';


sealed class CartState {}
abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}
class CartSuccessState extends CartState {
 final List<ProductDataMOdels> cartItems;

  CartSuccessState({required this.cartItems});
}

  
