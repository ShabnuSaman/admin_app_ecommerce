import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductSuccessfulEvent>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection("Products")
            .doc(event.name)
            .set({
          "name": event.name,
          "description": event.description,
          "price": event.price
        });
        emit(AddProductSuccessfulState());
      } catch (e) {
        emit(AddProductErrorState(e.toString()));
      }
    });
  }
}
