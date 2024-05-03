part of 'add_product_bloc.dart';

@immutable
sealed class AddProductEvent {}

class  AddProductSuccessfulEvent extends AddProductEvent{
  final String name;
  final String description;
  final String price;

  AddProductSuccessfulEvent({required this.name,required this.description,required this.price});

}
  class AddProductClearEvent extends AddProductEvent{
    
  }

