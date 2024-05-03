import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadProductsEvent>((event, emit)async {
      if (event is LoadProductsEvent) {
      emit(HomeLoadingState()) ;
      try {
        // final products = await FirebaseFirestore.instance
        //     .collection("Products")
        //     .get()
        //     .then((querySnapshot) => querySnapshot.docs
        //         .map((doc) => Product.fromFirestore(doc))
        //         .toList());
        emit(HomeProductsLoadedState());
      } catch (e) {
      }
    }
  
    });
  }
}


