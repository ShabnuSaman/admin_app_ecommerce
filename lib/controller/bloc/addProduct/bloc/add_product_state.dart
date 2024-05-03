part of 'add_product_bloc.dart';

@immutable
sealed class AddProductState {}

 class AddProductInitial extends AddProductState {}

class AddProductSuccessfulState extends AddProductState{
  
}

class AddProductErrorState extends AddProductState{
  final String errorMessage;

  AddProductErrorState(this.errorMessage);
}


